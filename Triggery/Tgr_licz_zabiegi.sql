USE [leczenie_rehabilitacja]
GO
/****** Object:  Trigger [dbo].[trg_licz_zab]    Script Date: 13.03.2022 15:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Trigger ma zadanie obliczyć, ile zabiegów zlecił lekarz i 
nie dopuścić do sytuacji dodania więcej niż 5 zabiegów
*/
ALTER   trigger [dbo].[trg_licz_zab] on [dbo].[Zabiegi_zlecone] after insert,update 
as
begin tran 
begin
	declare @ilość as int
	set @ilość = (
			select count(id_skier_wew) 
			 from dbo.Zabiegi_zlecone 
			where id_skier_wew = 
					     (
					        select distinct Id_skier_wew 
						  from inserted
					     )
		    group by id_skier_wew)
		          if @ilość > 5
				begin
			              rollback 
			              raiserror ('Dozwolone 5 zabiegów',9,1)
				end
commit
end

