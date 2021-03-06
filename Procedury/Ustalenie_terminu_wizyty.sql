USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[ustalenie_terminu_wizyty]    Script Date: 01.07.2022 12:20:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Procedura ustala termin wizyty do specjalisty
*/
ALTER     proc [dbo].[ustalenie_terminu_wizyty]
(
@id_pracownika as int,
@id_pacjenta as int,
@data as date = null
)
with execute as owner
as 
begin try
begin tran  
----Uzyskanie zmiennej w postaci pierwszego wolngo dnia pracy wymaganego specjalisty
				set @data = ISNULL(@data, getdate())
				declare @id_pracy as int
					Set @id_pracy = 
									(
									  select top 1 id_pracy 
									    from dbo.Grafik_Lek_fizjo 
									   where id_pracownika = @id_pracownika
									     and id_dzień > (
														  Select id_dzień 
														    from dbo.Kalendarz 
														   where dzień = @data
														 )
									     and id_status = 1
								    )
----Sprawdzenie czy wizyta do danego specjalisty nie została już umówiona wcześniej
---- Jeśli nie wizysta zostaje zapisana w tabeli wizyty 
	if exists (select id_pracy
	                , Id_pacjenta 
				 from dbo.Wizyty 
				where id_pacjenta = @id_pacjenta 
				  and id_pracy    = @id_pracy)
		begin
				Select 'Już wizyta jest umówiona dla pacjenta - sprawdź czy nie ma błędu' as Komunikat
		end
	else
		begin
				insert into dbo.Wizyty (Id_pacjenta,Id_pracy)
				     values (@id_pacjenta,@Id_pracy)
---- Sprawdzenie czy dany specjalista nie osiagnął już 10 pacjentów
---- na dany dzień. Jeśli tak procedura zmieni statut i ten dzień nie będzie 
---- już brany pod uwagę.
declare @count as int
set @count = 
			(
				select 
					count(id_pracy) 
				from dbo.Wizyty 
				where id_pracy = @id_pracy
			)
-------------------------------------------------
if @count = (
			 select ilość_pacjentów 
			   from dbo.Grafik_Lek_fizjo 
			  where id_pracy = @id_pracy
			 )
	begin 
		update dbo.Grafik_Lek_fizjo 
		   set id_status = 0
		 where id_pracy = @id_pracy
	end 
else
	begin 
		print 'są wolne miejsca' 
	end 	
end
commit
end try
begin catch
rollback 
		print 'błąd w transakcji ustalenie terminu'
		declare @id as int
		set @id = (select isnull(MAX(id_wizyty),0) from Wizyty)
		dbcc checkident('wizyty',reseed,@id)
		;throw
end catch 
