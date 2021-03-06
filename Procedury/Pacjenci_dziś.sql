USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[pacjenci_dziś]    Script Date: 29.06.2022 16:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Procedura pokazuje pacjentów którzy mają wizyt w danym dniu
*/
ALTER proc [dbo].[pacjenci_dziś]
(
	@dzień as date = null,
	@id_pracownika as int
)
as
begin
	set @dzień = isnull(@dzień,GETDATE())
	select  id_pacjenta
		  , imię
		  , nazwisko 
	   from dbo.Pacjenci
	  where id_pacjenta in (
	                         select id_pacjenta 
							   from dbo.Wizyty 
	                          where id_pracy = 
							                   (
												 select id_pracy 
												   from dbo.Grafik_Lek_fizjo
												  where id_dzień = 
																  (
																    select id_dzień 
					                                                  from dbo.Kalendarz 
																	 where dzień = @dzień
																  )
	    and id_pracownika = @id_pracownika
						 )					  )
end