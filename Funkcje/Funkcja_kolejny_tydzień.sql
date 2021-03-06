USE [leczenie_rehabilitacja]
GO
/****** Object:  UserDefinedFunction [dbo].[kolejny_tydzień]    Script Date: 13.03.2022 15:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Funkcja inline dodaje 5 dni od rozpoczęcia dnia zabiegowego.
Funkcja niezbędna do wyliczenia ilości osób na zabiegach. 
*/
ALTER   function [dbo].[kolejny_tydzień] 
(
@numer_zlecenia as int
)
Returns table
as
return
select numer_zlecenia
     , id_skier_wew
     , id_pracownika
     , id_dzień+5 as id_dzień
     , id_grupy
     , data_wystawienia 
from Numery_zleceń
where numer_zlecenia = @numer_zlecenia