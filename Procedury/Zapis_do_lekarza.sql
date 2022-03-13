USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[zapis_do_lekarza]    Script Date: 13.03.2022 14:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
			/*
			Za sprawą procedury dokonujemy zapisu do lekarza
			*/
ALTER   proc [dbo].[zapis_do_lekarza]
(
	@Nr_skier_zew as int, 
	@Data_wystawienia as date, 
	@Id_pacjenta as int,
	@Nazwa_części_ciała as varchar(25),
	@Uwagi as varchar(50) = 'brak',
	@data as date = null
)
WITH EXECUTE AS OWNER
as
set nocount on;
begin tran
begin try
    if @Data_wystawienia > GETDATE()
		begin 
			rollback
			raiserror ('Błędna data', 9,1)
		end 
	else
		begin
			set @data = ISNULL(@data, getdate())
			declare @Id_część_ciała as int
			set @Id_część_ciała = 
						(Select Id_część_ciała from dbo.Części_ciała
						 where Nazwa_części_ciała = @Nazwa_części_ciała)
			insert into Skierowania_zew (Nr_skier_zew, Data_wystawienia,Id_pacjenta,Id_część_ciała,Uwagi)
			values(@Nr_skier_zew, @Data_wystawienia, @Id_pacjenta, @Id_część_ciała,@Uwagi)
		end
						/* 
						dopasowanie lekarza, którego specjalizacja jet uraz pacjenta
						*/
		begin
				declare @id_pracownika as int
				set @id_pracownika = 
				  (
					select id_pracownika from dbo.Specjalizacje 
					where id_część_ciała = @Id_część_ciała
				  )
		end
					/*
					Ustalenie pierwszego wolnego terminu, bądź terminu po dacie wskazanej przez pacjenta
					*/
		begin
			exec ustalenie_terminu_wizyty
			@id_pracownika = @id_pracownika,
			@id_pacjenta = @Id_pacjenta,
			@data = @data
		end	
commit
end try
begin catch
		rollback
			declare @id as int
			set @id = (Select MAX(id_skier_zew) from Skierowania_zew)
			print 'coś poszło nie tak'
			dbcc checkident ('Skierowania_zew',reseed,@id)
end catch 





