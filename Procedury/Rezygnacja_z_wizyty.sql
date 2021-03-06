USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[rezygnacja_z_wizyty]    Script Date: 28.06.2022 11:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
	Za sprawą procedury kasujemy wizyty pacjenta. 
*/
ALTER   procedure [dbo].[rezygnacja_z_wizyty]
@id_pacjenta as int,
@data as date = Null
as
begin try
begin tran 
begin
---- aktualizacja grafiku. Lekarz/Fizjterpauta może przyjąć max 10 pacjentów
---- skoro osoba rezygnuje status zostaje zmieniony. 
set @data = ISNULL(@data, getdate())
	update Grafik_Lek_fizjo
	set id_status  = 1
	where id_pracy in 
						(
							select w.id_pracy 
							  from dbo.Wizyty           as w
						inner join dbo.Grafik_Lek_fizjo as g
							    on g.Id_pracy = w.Id_pracy
						inner join dbo.Kalendarz        as k
							    on k.id_dzień = g.Id_dzień
						inner join dbo.Pracownicy       as pp
							    on pp.id_pracownika = g.id_pracownika
							 where w.id_pacjenta = @id_pacjenta
							   and k.dzień       > @data
						)
	  and Id_status = 0
----Usunięcie wizyty zaplanowanej dla pacjenta
delete from wizyty 
where id_pracy in (     select w.id_pracy 
						  from dbo.Wizyty as w
					inner join dbo.Grafik_Lek_fizjo as g
						    on g.Id_pracy = w.Id_pracy
					inner join dbo.Kalendarz        as k
						    on k.id_dzień = g.Id_dzień
					inner join dbo.Pracownicy       as pp
						    on pp.id_pracownika = g.id_pracownika
						where w.id_pacjenta = @id_pacjenta
						  and k.dzień       > @data
						)
and Id_pacjenta = @id_pacjenta
-------------------------------------------------
end
commit
end try
begin catch
rollback
print 'błąd popraw'
;throw
end catch 