USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[zmień_termin_zabiegów]    Script Date: 13.03.2022 14:56:27 ******/
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
begin 
				/*
					Sprawdzenie czy zabiegi już trwają.
					Termin nie moze być zmieniony jeśli zabiegi się już rozpoczeły.	
				*/
		declare @id_dzień as int
					set @id_dzień = (select id_dzień from dbo.Kalendarz 
								where dzień = getdate())
		declare @id_skier_wew as int
					set @id_skier_wew = (select max(id_skier_wew) from dbo.Skierowania_wew 
								where id_pacjenta = @id_pacjenta)
		if @id_dzień > (Select id_dzień from dbo.Numery_zleceń 
							where Id_skier_wew = @id_skier_wew)
			begin
				rollback tran
				raiserror ('Zabiegi juz trwają. Nie można przesunąć terminu',9,1)
			end
		else
begin
begin
    Declare @nr_zlecenia as int 
	set @nr_zlecenia = 
					(select numer_zlecenia from dbo.Numery_zleceń 
					   where Id_skier_wew = @id_skier_wew)
	Declare @id_pracownika_wystawiającego as int 
	set @id_pracownika_wystawiającego = 
							(select id_pracownika from dbo.Numery_zleceń 
							    where Id_skier_wew = @id_skier_wew)						
						/* 					
							Usunięcie zlecenia, które dotyczyło zabiegów
						*/
	delete from dbo.Numery_zleceń
	where Id_skier_wew = @id_skier_wew
end
						/*
							Usunięcie zabiegów po zakończonych zabiegach

					    */
begin
	exec rezygnacja_z_wizyty
	@id_pacjenta = @id_pacjenta
end
						/*
							Stworzenie nowego zlecenia, przypisanie nowego terminu 
							oraz wyznaczenie wizyt do lekarza i fizjoterapeuty
						*/
begin
exec dodaj_zlecenie
@id_pacjenta = @id_pacjenta,
@id_pracownika = @id_pracownika_wystawiającego,
@nazwa_grupy = @nazwa_grupy,
@data = @nowy_termin
end
end
end
commit
end try 
begin catch
print 'błąd - termin nie został zmieniony'
rollback
;throw
end catch 