USE [leczenie_rehabilitacja]
GO
/****** Object:  Trigger [dbo].[tgr_skasowane_zabiegi]    Script Date: 13.03.2022 15:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Trigger ma za zadanie przekazać skasowane dane do nowej tabeli 
*/
ALTER   trigger [dbo].[tgr_skasowane_zabiegi] on [dbo].[Zabiegi_zlecone]
after delete 
as
begin
	insert into Skasowane_zabiegi(id_skier_wew,id_część_ciała,id_zabiegu,id_strony_ciała,id_urazu)
	Select id_skier_wew
	      , id_część_ciała
              , id_zabiegu
              , id_strony_ciała
              , id_urazu 
          from deleted
end