USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[rezygnacja_z_zabiegów]    Script Date: 28.06.2022 11:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	/*
		Za sprawą procedury kasujemy zabiegi, 
		jeśli pacjent z nich zrezygnował.
		Zastosowano cascadowe usuwanie klucza obcego.
	*/
ALTER   proc [dbo].[rezygnacja_z_zabiegów] 
@id_pacjenta as int,
@data as date = null
as
begin try
begin tran 
begin
set @data = ISNULL(@data, getdate())
declare @id_skier_wew as int 
	set @id_skier_wew = 
					   (
						Select max(id_skier_wew) 
					      from Skierowania_wew 
						 where id_pacjenta = @id_pacjenta
					   )
----Usunięcie skierowania wewnętrznego
delete from Skierowania_wew
	  where id_skier_wew = @id_skier_wew
-------------------------------------------------
/*
	W przypadku rezygnacji z zabiegów. 
	Usuwane są również wizyty kontrolne.
*/
-------------------------------------------------
exec rezygnacja_z_wizyty
@id_pacjenta = @id_pacjenta,
@data = @data
end
-------------------------------------------------
commit
end try
begin catch
rollback
Select 'Zabieg nie został usunięty' as komunikat
;throw
end catch 