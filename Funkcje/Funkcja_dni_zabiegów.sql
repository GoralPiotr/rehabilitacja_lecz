USE [leczenie_rehabilitacja]
GO
/****** Object:  UserDefinedFunction [dbo].[dni_zabiegów]    Script Date: 13.03.2022 15:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Funkcja dodaje 5 dni do id dnia, rozpoczynajacego zabiegi
*/
ALTER   function [dbo].[dni_zabiegów]
(@id_dzień as smallint)
returns int
as
begin
declare @max_dzień as smallint
set @max_dzień = (@id_dzień +5)
return @max_dzień
end 