/*
Za spraw� procedury dodajemy nowego pacjenta. 
Podczas wpisywania pacjenta sprawdzana jest poprawno�� numeru pesel. 
W przypadku b��du, procedura zostanie wycofana. 
*/
ALTER   proc [dbo].[dodaj_pacjenta]
(
	@Imi� as varchar(15),
	@Nazwisko as varchar(30),
	@Pesel as char(11),
	@Telefon as varchar(11) = 'brak',
	@Email as varchar(20) ='brak'
)
as
begin try
begin tran 
declare @cyfra as int 
declare @liczba_sta�a as int = 10
declare @kontrolna as int = right(@pesel,1)
----Sprawdzenie poprawno�ci numeru pesel. 
----Gdy jest poprawny pacjent zostanie dodany do bazy
	if exists(
			   select pesel 
				 from dbo.Pacjenci 
			    where pesel = @pesel
			  )
			begin
				select ('pacjent ju� istnieje') as komunikat
			end 
   else
			begin
				;with obliczenia as
				(
					select  0  as liczba
						 , 'a' as pesel
				 union all
					select liczba+1
					     , SUBSTRING(@pesel,liczba+1,1) as pesel 
					  from obliczenia
					 where liczba + 1 <=11
				)
					select @cyfra = right(sum(pesel*waga),1) 
					  from obliczenia as o
				inner join wagi       as w
				        on o.liczba = w.id
			
				if 
					@kontrolna - right(@liczba_sta�a - @cyfra,1) = 0
				  begin
						insert into dbo.pacjenci (imi�,nazwisko,pesel,Telefon,email)
							 values(@imi�,@nazwisko,@pesel,@Telefon,@Email)
							 select('pacjent dodany') as komunikat
							 select * 
							   from dbo.Pacjenci 
							  where pesel = @pesel
				  end 
			  else
				  begin
					select 'b��dny pesel' as komunikat
				  end
			end
commit
end try
begin catch
begin
rollback
		Select 'B��d. Pacjent nie zosta� dodany' as komunikat
	   declare @id as int
           set @id = (
						select isnull(max(Id_pacjenta),0)
		                  from dbo.Pacjenci
					  )
dbcc checkident('Pacjenci',reseed,@id)
end
end catch




