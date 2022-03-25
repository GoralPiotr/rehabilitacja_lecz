USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[pacjenci_dziś]    Script Date: 25.03.2022 12:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
			/*
				Procedura pokazuje pacjentów którzy mają wizytęw pokazany dzień 
			*/
ALTER proc [dbo].[pacjenci_dziś]
(
@dzień as date,
@id_pracownika as int
)
as
begin
	select id_pacjenta, imię, nazwisko from dbo.Pacjenci
	where id_pacjenta in (
	select id_pacjenta from dbo.Wizyty 
	where id_pracy = (
	select id_pracy from dbo.Grafik_Lek_fizjo
	where id_dzień = 
					(select 
							id_dzień 
					from dbo.Kalendarz where dzień = @dzień)
	and id_pracownika = @id_pracownika
	))
end