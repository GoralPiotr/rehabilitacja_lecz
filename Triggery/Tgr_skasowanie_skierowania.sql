USE [leczenie_rehabilitacja]
GO
/****** Object:  Trigger [dbo].[tgr_skasowane_skierowania]    Script Date: 01.07.2022 13:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Trigger ma za zadanie, przekzać skasowane dane do nowej tabeli. 
*/
ALTER   trigger [dbo].[tgr_skasowane_skierowania] on [dbo].[Skierowania_wew]
after delete 
as
begin
	insert into Skasowane_skierowania(id_skier_wew,id_pacjenta,id_pracownika_wystawiajacego)
		 Select id_skier_wew
		      , id_pacjenta
			  , id_Pracownika
		   from deleted
end
