USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[zapis_do_lekarza]    Script Date: 29.06.2022 15:11:32 ******/
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
set @data = ISNULL(@data,getdate())
      if @Data_wystawienia > GETDATE()
		 begin 
			select 'Data wystawienia nie może być późniejsza niż dzień dzisiejszy'
		 end 
	  else
		  if @Data_wystawienia < (dateadd(d,-31,GETDATE()))
	        begin
		         select 'Skierowanie przeterminowane'
	          end
          else 
	          begin
					declare @Id_część_ciała as int
					set @Id_część_ciała = 
										  (
										   Select Id_część_ciała 
											 from dbo.Części_ciała
											where Nazwa_części_ciała = @Nazwa_części_ciała
										  )
					insert into Skierowania_zew (Nr_skier_zew, Data_wystawienia,Id_pacjenta,Id_część_ciała,Uwagi)
					values(@Nr_skier_zew, @Data_wystawienia, @Id_pacjenta, @Id_część_ciała,@Uwagi)
								/* 
								dopasowanie lekarza, którego specjalizacja jet uraz pacjenta
								*/
		
					declare @id_pracownika as int
					set @id_pracownika = 
											(
											   select id_pracownika 
												 from dbo.Specjalizacje 
												where id_część_ciała = @Id_część_ciała
											)
									/*
							Ustalenie pierwszego wolnego terminu, bądź terminu po dacie wskazanej przez pacjenta
							*/
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
			set @id = (
						Select isnull(MAX(id_skier_zew),0)
			              from Skierowania_zew
					  )
			print 'skierowanie nie zostało wpisane'
			dbcc checkident ('Skierowania_zew',reseed,@id)
end catch 





