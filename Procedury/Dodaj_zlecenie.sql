USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[dodaj_zlecenie]    Script Date: 01.07.2022 11:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
		/*
			Za pomocą tej procedury, użytkownik - fizjoterapeuta. Wyznacza term wykonania zabiegów.
		*/
ALTER   proc [dbo].[dodaj_zlecenie]
(
	@id_pacjenta as int,
	@id_pracownika as int,
	@nazwa_grupy as varchar(10),
	@data as date = null
)
WITH EXECUTE AS OWNER
as
begin try
begin tran
begin 
set @data = ISNULL(@data, getdate())
declare @id_grupy as int
		select @id_grupy = id_grupy 
		  from dbo.grupy_zabiegów
		 where nazwa = @nazwa_grupy 
-------------------------------------------------
declare @id_skier_wew as int
		select  @id_skier_wew = max(id_skier_wew) 
		  from dbo.Skierowania_wew
		 where id_pacjenta = @id_pacjenta
-------------------------------------------------
declare @zliczenie as int
		select @zliczenie = count(id_skier_wew) 
		  from dbo.Zabiegi_zlecone
		 where Id_skier_wew = @id_skier_wew
	  group by id_skier_wew
-------------------------------------------------
declare @id_koniec_zabiegów as int
    set @id_koniec_zabiegów 
							= (select max(id_dzień)+10 
							     from dbo.Numery_zleceń as nz 
						   inner join Skierowania_wew   as sw
								   on sw.Id_skier_wew = nz.Id_skier_wew
								where id_pacjenta  = @id_pacjenta)
-------------------------------------------------
/* 
	Fragment sprawdza czy poprzednie zabiegi się zakończyły. Nie można dodać
	nowych gdy poprzednie jeszcze trwają. 
*/
declare @id_dzień as int 
		set @id_dzień = (
							Select id_dzień 
							from dbo.kalendarz 
							where dzień = @data
						)
	if @id_koniec_zabiegów > @id_dzień
		begin
			select 'zabiegi jeszcze trwają' as komunikat
		end
	else
		begin
/*
	Fragment kodu ma zazadanie sprawdzić kiedy jest najblizszy potencjalny termin
	wszystkich zabiegów. Musi brać pod uwagę, że wszystkie zabiegi powinny 
	być wykonane w tym samym czasie. Niedopuszczalna jest sytuacja że część będzie można
	wykonać teraz a część dopiero za miesiąc. 
*/
declare @z as int
declare @i as int
Declare @y as int 
				select @z = max(d.id_dzień)
					 , @y = min(d.id_dzień) 
				  from
					  (
						select top 2 c.id_dzień 
						  from 
								(
									select kz.id_dzień
									     , kz.id_zabiegu
										 , kz.id_grupy
										 , count(a.id_zabiegu) as ilość_wykorzystanych
									  from dbo.kalendarz_zabiegowy as kz
								inner join Zabiegi as z
										on kz.id_zabiegu = z.Id_zabiegu
								 left join 
										  (
											select zz.id_zabiegu
											     , b.Id_grupy
												 , b.Id_dzień from 
																  (
																	select * 
																	  from dbo.Numery_zleceń
																	 union
																	select l.* 
																	  from dbo.Numery_zleceń
															   cross apply kolejny_tydzień(numer_zlecenia) as l
															        ) as b
													      inner join Zabiegi_zlecone as zz 
			                                                      on zz.Id_skier_wew = b.Id_skier_wew
										  ) as a
											on a.id_zabiegu = kz.id_zabiegu
										   and kz.id_grupy  = a.id_grupy
										   and kz.id_dzień  = a.id_dzień
									where kz.id_dzień > (
														 select id_dzień 
									                       from dbo.Kalendarz 
														  where dzień = @data
														 )
									  and kz.id_zabiegu in (
															 select id_zabiegu 
									                           from dbo.Zabiegi_zlecone
															  where id_skier_wew = @id_skier_wew
															)
									  and kz.id_grupy = @id_grupy
							group by kz.id_k_z,kz.id_dzień,kz.id_zabiegu,kz.id_grupy
							  having count(a.id_zabiegu) < (
															select z1.max_ilość_grupa 
															  from dbo.Zabiegi as z1 
															 where z1.Id_zabiegu = kz.id_zabiegu
															)
						) as c
						group by c.id_dzień
						having count(c.id_dzień) = @zliczenie
						) as  d
if @z - @y = 5 
set @i = @y
else 
set @i= @z
		insert into Numery_zleceń (Id_skier_wew,id_pracownika,id_dzień,id_grupy)
		values (@id_skier_wew,@id_pracownika,@i,@id_grupy)
/*
	Poniższy fragment wyznacza wizyty kontrolne u fizjoterapeuty, a następnie
	u lekarza w celu ewentulanych wizyt kontrolnych. Kod pilnuje aby odbyły się 
	one po zakończonych zabiegach i w pierwszym wolnym terminie. 
*/
-------------------------------------------------
declare @dzień as date
set @dzień = (
				select dzień 
				  from dbo.Kalendarz
				 where id_dzień =  @i+10 
			 )
----Ustalenie terminu do fizjoterapeuty
exec ustalenie_terminu_wizyty
@id_pracownika = @id_pracownika,
@id_pacjenta = @id_pacjenta,
@data = @dzień
-----Ustalenie terminu wizyty u lekarza. 
declare @id_pracownika2 as int
declare @id_profesji as int
	set @id_profesji = (
						select id_profesji 
						  from dbo.Pracownicy
						 where Id_pracownika = @id_pracownika
						 )
if @id_profesji = 2  
	   set @id_pracownika2 = (
				select p.id_pracownika 
				  from pracownicy as p
			inner join specjalizacje as s
					on s.id_pracownika = p.id_pracownika
				  where s.id_część_ciała = (
											select id_część_ciała 
											  from zabiegi_zlecone
											 where id_zabiegu_zleconego = (
																			select max(id_zabiegu_zleconego) 
																			  from zabiegi_zlecone
																			 where id_skier_wew = @id_skier_wew)
																		   ))
	    
	  else
		set  @id_pracownika2  = 
								 (
									select id_pracownika 
									  from dbo.Skierowania_wew
									 where Id_skier_wew = @id_skier_wew 
							     ) 
---------------------------------------------------
declare @dzień2 as date
		set @dzień2 = (
						select top 1 dzień 
						from dbo.Kalendarz
						where dzień >  @dzień 
					  )
-------------------------------------------------
exec ustalenie_terminu_wizyty
@id_pracownika = @id_pracownika2,
@id_pacjenta = @id_pacjenta,
@data = @dzień2
-------------------------------------------------
end
end
commit
end try 
begin catch
rollback
print'wycofano całość'
declare @id as int set @id = (select isnull(MAX(id_skier_wew),0)
								from Skierowania_wew)
dbcc checkident ('Skierowania_wew', reseed, @id)
;throw
end catch 
