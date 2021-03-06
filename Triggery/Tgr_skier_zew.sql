USE [leczenie_rehabilitacja]
GO
/****** Object:  Trigger [dbo].[tgr_skier_zew]    Script Date: 13.03.2022 15:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Trigger ma za zadanie pilnować czy skierowanie zewnętrzne nie jest starsze niż 31 dni
TRIGGER USUNIĘTY. Zastąpiono fragmentem TSQL w procedurze "Zapis do lekarza"
*/
ALTER   trigger [dbo].[tgr_skier_zew] on [dbo].[Skierowania_zew]
after insert,update 
as
begin
		Declare @data as date 
		Select @data = data_wystawienia 
		  from skierowania_zew

		if @data < GETDATE() - 31
			begin
				rollback
				raiserror ('Skierowanie przeterminowane', 9, 1)
		declare @id_skier_zew as int
		set @id_skier_zew = (select MAX(id_skier_zew) 
				       from skierowania_zew)
		dbcc checkident ('skierowania_zew',reseed,@id_skier_zew)

			end
end

