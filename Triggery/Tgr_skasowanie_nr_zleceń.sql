USE [leczenie_rehabilitacja]
GO
/****** Object:  Trigger [dbo].[tgr_skasowane_nr_zleceń]    Script Date: 13.03.2022 15:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Trigger ma za zadanie, po wyknoaniu skasowania numeru zleceń, 
przekazać poniższe wiersze do nowej tabeli. 
*/
ALTER   trigger [dbo].[tgr_skasowane_nr_zleceń] on [dbo].[Numery_zleceń]
after delete
as
begin
insert into Skasowane_numery_zleceń(id_skier_wew,id_pracownika,id_grupy)
select id_skier_wew,id_pracownika,id_grupy from deleted
end