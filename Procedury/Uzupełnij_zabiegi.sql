USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[uzupełnij_zabiegi]    Script Date: 29.06.2022 00:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   proc [dbo].[uzupełnij_zabiegi]
(
@id_pacjenta as int,
@zabieg1 as varchar(100),
@zabieg2 as varchar(100) = null,
@zabieg3 as varchar(100) = null,
@zabieg4 as varchar(100) = null,
@zabieg5 as varchar(100) = null
)
WITH EXECUTE AS OWNER
as
begin tran
begin try
---- deklaracja zmiennych
		declare @zabiegi as zabiegi
		declare @id_dzień as int
				set @id_dzień = (
								 select id_dzień 
								   from dbo.Kalendarz 
								  where dzień = getdate()
								 )
		declare @id_skier_wew as int
				set @id_skier_wew = (
									 select max(id_skier_wew) 
									   from dbo.Skierowania_wew 
									  where id_pacjenta = @id_pacjenta
									)
---- sprawdzenie czy pacjent nie jest w trkacie zabiegów
		if @id_dzień > (
						 Select id_dzień 
						   from dbo.Numery_zleceń 
						  where Id_skier_wew = @id_skier_wew
						)
			begin
				Select 'Zabiegi juz trwają. Nie można skasować ani dodać nowego zabiegu'
			end
		else
			begin
				insert into @zabiegi (zabieg)
				values(@zabieg1),(@zabieg2),(@zabieg3),(@zabieg4),(@zabieg5)
;with obliczenia as
		(
		select id
			 , max(case when lp = 1 then wartość end) as Nazwa_części_ciała
			 , max(case when lp = 2 then wartość end) as Zabieg
			 , max(case when lp = 3 then wartość end) as Strona_ciała
			 , max(case when lp = 4 then wartość end) as kod_urazu
			 , max(case when lp = 5 then wartość end) as Uwagi
		  from
				 (
						select id
							 , value as wartość
							 , row_number () over (partition by id order by id) as lp
						  from @zabiegi
				   cross apply string_split(Zabieg,',')
				  ) as tabela
		  group by id
		 ) 
	   insert into zabiegi_zlecone (Id_skier_wew,Id_część_ciała,Id_zabiegu,Id_strony_ciała,Id_urazu,Uwagi)
		    select @id_skier_wew
				 , cc.Id_część_ciała
			     , snz.id_skrótu_nazwy_zabiegu as id_zabiegu
				 , sc.id_strony_ciała
				 , u.id_urazu,Uwagi 
			  from obliczenia               as o
		inner join dbo.Części_ciała         as cc
		        on cc.Nazwa_części_ciała = o.Nazwa_części_ciała
		inner join dbo.Skróty_nazw_zabiegów as snz
		        on o.Zabieg = snz.Skrót
		inner join dbo.Strony_ciała         as sc
		        on o.Strona_ciała        = sc.Strona_ciała
		inner join dbo.urazy                as u
		        on u.Kod_urazu           = o.kod_urazu
end
-------------------------------------------------
commit
end try 
begin catch
rollback
print'Uzupełnij zabiegi'
declare @id as int set @id = (select isnull(MAX(id_zabiegu_zleconego),0)
								from Zabiegi_zlecone)
dbcc checkident ('Zabiegi_zlecone', reseed, @id)
;throw
end catch 