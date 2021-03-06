USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[dodaj_zabiegi]    Script Date: 30.06.2022 09:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Za sprawą tej procedury, użytkownik(lekarz) dodaje zabiegi dla pacjenta. 
	Pacjent może podać termin od kiedy potencjalnie może udać sie do fizjoterpauety.
	W przypadku braku daty procedura wyznaczy najbliższy wolny termin u fizjoterapeuty. 
*/
ALTER   proc [dbo].[dodaj_zabiegi] 
(
@id_pacjenta as int,
@id_pracownika as int,
@zabieg1 as varchar(100),
@zabieg2 as varchar(100) = null,
@zabieg3 as varchar(100) = null,
@zabieg4 as varchar(100) = null,
@zabieg5 as varchar(100) = null,
@data as date = null
)
with execute as owner
as
begin try
begin tran 
		declare @id_profesji as smallint
			set @id_profesji = (
								 select id_profesji 
								   from dbo.pracownicy
								  where Id_pracownika = @id_pracownika
								 )
		set @data = ISNULL(@data, getdate())
		declare @dzień as date 
		set @dzień = getdate()
/* 
	poniższy fragment ma zazadanie pilnować aby użytkownik nie dodał nowych 
	nowych zabiegów w przypadku gdy pacjent jeszcze kontynuje poprzednie zabiegi
	oraz ewentualnej pomyłki przy loginie pacjenta, aby nie dodał błędnych zabiegów
	dla innego pacjenta. W przypadku błędu całość zostanie wycofana.
*/
		declare @id_koniec_zabiegów as int
			set @id_koniec_zabiegów 
									= (
										select max(id_dzień)+10 
										  from dbo.Numery_zleceń   as nz 
								    inner join dbo.Skierowania_wew as sw
											on sw.Id_skier_wew = nz.Id_skier_wew
										 where id_pacjenta     = @id_pacjenta
									   )
		declare @id_dzień as int 
			set @id_dzień = 
							(
							  Select id_dzień 
							    from dbo.Kalendarz 
							   where dzień = @data
							 )
		declare @id_dzień_następnej_wizyty as int
			set @id_dzień_następnej_wizyty = 
											(
											  select id_dzień 
											    from dbo.Grafik_lek_fizjo
											   where id_pracy = 
															   (
																select id_pracy 
																  from dbo.Wizyty 
																 where Id_wizyty = 
																				  (
																					select max(id_wizyty) 
																					  from dbo.Wizyty
																					 where id_pacjenta = @id_pacjenta))
												 and id_pracownika <> @id_pracownika
																)
		if @id_dzień_następnej_wizyty > @id_dzień
			begin
				 select 'zabiegi jeszcze nie zostały zlecone'
			end 
		else 
			if @id_koniec_zabiegów > @id_dzień
		       begin
					select 'zabiegi jeszcze trwają'
			   end
			else
/*
	Podczas wypisywania zabiegów automatycznie tworzone jest skierowanie. 
*/
				begin
					declare @nr_skier_wew as varchar(20)
						set @nr_skier_wew = 
											(
											 Select Concat(@id_pacjenta,@id_pracownika,@dzień)
											)	
				insert into Skierowania_wew (Nr_skier_wew,id_pacjenta,id_pracownika)
					 values (@nr_skier_wew, @id_pacjenta,@id_pracownika)
/*
	Elementy kodu przechodzą do kolejnej procedury której przeznaczeniem jest
	ustalić jaki zabieg powinien być wykonany dla Pacjenta
*/
				exec uzupełnij_zabiegi
				@id_pacjenta = @id_pacjenta,
				@zabieg1 = @zabieg1,
				@zabieg2 = @zabieg2,
				@zabieg3 = @zabieg3,
				@zabieg4 = @zabieg4,
				@zabieg5 = @zabieg5
/* 
Odnalezienie pracownika-fizjoterpaeuty który dysponuje najbliższym wolnym terminem
W przypadku gdy skierowanie wystawia fizjoterapeuta poniższy blok ominie ponowną wizytę 
u specjalisty przed rozpoczęciem zabiegów. 
*/
			if @id_profesji = 2 
				begin
						Select 'Dane dodane ale wystawia fizjoterapeuta nie dodajemy kolejnej wizyty' as komunikat
				end
			else 
				begin
				declare @id_pracownika2 as smallint
					set @id_pracownika2 = 
										(
											select top 1 g.Id_pracownika 
											  from dbo.Pracownicy       as p
										inner join dbo.Grafik_Lek_fizjo as g
											    on p.Id_pracownika = g.Id_pracownika
											 where Id_profesji  = 2
											   and id_dzień > (select id_dzień 
																 from dbo.Kalendarz 
																where dzień = @data)
											   and id_status = 1
										  order by id_dzień
										)
/*
Ustalenie wolnego i zapisanie pacjenta w pierwszym wolnym terminie, bądź w terminie, który wyznaczy Pacjent
*/
				exec ustalenie_terminu_wizyty
				@id_pracownika = @id_pracownika2,
				@id_pacjenta = @Id_pacjenta,
				@data = @data	
			end
			end
commit
end try 
begin catch
rollback
print'wycofano Skierowania_wew'
declare @id as int Set @id = (select isnull(MAX(id_skier_wew),0) 
								from Skierowania_wew)
dbcc checkident ('Skierowania_wew', reseed, @id)
;throw
end catch 


