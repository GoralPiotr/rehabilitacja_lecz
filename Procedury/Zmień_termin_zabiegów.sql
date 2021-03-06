USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[zmień_termin_zabiegów]    Script Date: 29.06.2022 00:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Za sprawą procedury zmieniamy termin zabiegów na podany przez pacjenta termin
*/
ALTER   proc [dbo].[zmień_termin_zabiegów]
@id_pacjenta as int,
@id_pracownika as int,
@nazwa_grupy as varchar(10),
@nowy_termin as date
as
begin try
begin tran 
/*
	Sprawdzenie czy zabiegi już trwają.
	Termin nie moze być zmieniony jeśli zabiegi się już rozpoczeły.	
*/
declare @id_dzień as int
			set @id_dzień =  (
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
		if @id_dzień > (
						Select id_dzień 
		                  from dbo.Numery_zleceń 
						 where Id_skier_wew = @id_skier_wew
						)
			begin
					Select 'Zabiegi juz trwają. Nie można przesunąć terminu' as Komunikat
			end
		else
			begin
				Declare @nr_zlecenia as int 
					set @nr_zlecenia = 
					                   (
									     select numer_zlecenia 
									       from dbo.Numery_zleceń 
										  where Id_skier_wew = @id_skier_wew
										)
				Declare @id_pracownika_wystawiającego as int 
					set @id_pracownika_wystawiającego = 
														(
														  select id_pracownika 
														    from dbo.Numery_zleceń 
														   where Id_skier_wew = @id_skier_wew
														)						
/* 					
	Usunięcie zlecenia, które dotyczyło zabiegów
*/
	delete from dbo.Numery_zleceń
		  where Id_skier_wew = @id_skier_wew

/*
	Usunięcie zabiegów po zakończonych zabiegach

*/

	exec rezygnacja_z_wizyty
	@id_pacjenta = @id_pacjenta
/*
	Stworzenie nowego zlecenia, przypisanie nowego terminu 
	oraz wyznaczenie wizyt do lekarza i fizjoterapeuty
*/

	exec dodaj_zlecenie
	@id_pacjenta = @id_pacjenta,
	@id_pracownika = @id_pracownika_wystawiającego,
	@nazwa_grupy = @nazwa_grupy,
	@data = @nowy_termin

				end
commit
end try 
begin catch
print 'błąd - termin nie został zmieniony'
rollback
;throw
end catch 