USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[dodaj_pracownika]    Script Date: 27.06.2022 10:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Za sprawą procedury dodajemy nowego pracownika 
*/
ALTER   proc [dbo].[dodaj_pracownika]
@Imię_pracownika as varchar(20),
@Nazwisko_pracownika as varchar(30),
@Nazwa_profesji as varchar(14)
WITH EXECUTE AS OWNER
as
begin try
begin tran 
begin
declare @id_profesji as smallint 
	set @id_profesji = 
					  (
						Select id_profesji 
						  from dbo.Profesje 
						 where Nazwa_profesji = @Nazwa_profesji
					   )
	insert into Pracownicy
	     values (@Imię_pracownika,@Nazwisko_pracownika,@id_profesji)
		 Select 'Jeśli dodałeś lekarza. Uzupełnij jego specjalizację' as komunikat
commit
end
end try
begin catch
rollback
print 'błąd - spróbuj ponownie'
declare @id as int set @id =
							(
								select isnull(MAX(id_pracownika),0)
								  from dbo.Pracownicy
							)
dbcc checkident ('dbo.Pracownicy',reseed,@Id)
;throw
end catch


