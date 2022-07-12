/*
Za spraw¹ procedury dodajemy nowego pacjenta. 
Podczas wpisywania pacjenta sprawdzana jest poprawnoœæ numeru pesel. 
W przypadku b³êdu, procedura zostanie wycofana. 
*/
ALTER   proc [dbo].[dodaj_pacjenta]
(
	@Imiê as varchar(15),
	@Nazwisko as varchar(30),
	@Pesel as char(11),
	@Telefon as varchar(11) = 'brak',
	@Email as varchar(20) ='brak'
)
as
begin try
begin tran 
declare @cyfra as int 
declare @liczba_sta³a as int = 10
declare @kontrolna as int = right(@pesel,1)
----Sprawdzenie poprawnoœci numeru pesel. 
----Gdy jest poprawny pacjent zostanie dodany do bazy
	if exists(
			   select pesel 
				 from dbo.Pacjenci 
			    where pesel = @pesel
			  )
			begin
				select ('pacjent ju¿ istnieje') as komunikat
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
					@kontrolna - right(@liczba_sta³a - @cyfra,1) = 0
				  begin
						insert into dbo.pacjenci (imiê,nazwisko,pesel,Telefon,email)
							 values(@imiê,@nazwisko,@pesel,@Telefon,@Email)
							 select('pacjent dodany') as komunikat
							 select * 
							   from dbo.Pacjenci 
							  where pesel = @pesel
				  end 
			  else
				  begin
					select 'b³êdny pesel' as komunikat
				  end
			end
commit
end try
begin catch
begin
rollback
		Select 'B³¹d. Pacjent nie zosta³ dodany' as komunikat
	   declare @id as int
           set @id = (
						select isnull(max(Id_pacjenta),0)
		                  from dbo.Pacjenci
					  )
dbcc checkident('Pacjenci',reseed,@id)
end
end catch




