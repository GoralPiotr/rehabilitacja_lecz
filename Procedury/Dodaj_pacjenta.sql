USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[dodaj_pacjenta]    Script Date: 12.03.2022 22:38:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Za sprawą procedury dodajemy nowego pacjenta. 
Podczas wpisywania pacjenta sprawdzana jest poprawność numeru pesel. 
W przypadku błędu, procedura zostanie wycofana. 
*/
ALTER   proc [dbo].[dodaj_pacjenta]
(
@Imię as varchar(15),
@Nazwisko as varchar(30),
@Pesel as char(11),
@Telefon as varchar(11) = 'brak',
@Email as varchar(20) ='brak'
)
WITH EXECUTE AS OWNER
as
begin try
begin tran 
begin
		if exists(select pesel from dbo.Pacjenci where pesel = @pesel)
			begin
				rollback
				select ('pacjent już istnieje') as komunikat
			end 
		else
			begin
					declare @cyfry as table
					(id int identity(1,1),
					waga int)
						declare @wprowadzany_pesel as table
						(id int identity(1,1),
						pesel int) 
							insert into @cyfry (waga)
							values(1),(3),(7),(9),(1),(3),(7),(9),(1),(3)
					declare @nr as int = 1
					while @nr <= 10
					begin
						insert into @wprowadzany_pesel
						select substring(@pesel, @nr,1)
						set @nr = @nr+1
					end
						declare @suma as int
						set @suma = (select sum(b.pesel*a.waga) as wyliczenie 
						from @cyfry as a join @wprowadzany_pesel as b
						on a.id = b.id)
						declare @kontrolna_cyfra as int
						declare @stała_cyfra as int = 10
					if right(@suma,1) = 0
					begin
						Set @kontrolna_cyfra = 0
					end
					else
					begin
						set @kontrolna_cyfra = (@stała_cyfra - right(@suma,1))
					end
						if @kontrolna_cyfra = (select right(@pesel,1))
							begin
									insert into pacjenci (imię,nazwisko,pesel,Telefon,email)
									values(@imię,@nazwisko,@pesel,@Telefon,@Email)
									print 'pesel poprawny'
								select ('pacjent dodany') as komunikat
								select * from dbo.Pacjenci where pesel = @pesel
						commit
						end
				else 
						begin
							rollback 
							print 'pesel niepoprawny'
						end
end
end
end try
begin catch
rollback
begin 
set nocount on
print 'Brak takiej osoby w bazie. W celu dodania osoby do bazy 
	   wpisz imię,nazwisko,pesel oraz ew. nr_tel,email'
declare @id as int
set @id = (select max(Id_pacjenta) from dbo.Pacjenci)
dbcc checkident('Pacjenci',reseed,@id)
end
end catch

