USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[kasuj_zabiegi]    Script Date: 28.06.2022 10:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Procedura ma za zadanie skasować zabieg,który został przypisany pacjentowi w wyniku pomyłki
	Nie można już w ten sposób skasować zabiegu, gdy pacjent rozpocznie cykl.
*/

ALTER     proc [dbo].[kasuj_zabiegi]
@id_pacjenta as int ,
@skrót_nazwy_zabiegu as varchar(10),
@Nazwa_części_ciała as varchar(22)
as
begin try
begin tran
		declare @id_dzień as int
					set @id_dzień = (
									 select id_dzień 
									   from dbo.Kalendarz 
									  where dzień = getdate()
									 )
		declare @id_skier_wew as int
				set @id_skier_wew = (
									  select max(id_skier_wew) 
									    from dbo.Skierowania_wew 
									   where id_pacjenta = @id_pacjenta
									 )
/*
	Procedura sprawdza czy zabiegi już się nie rozpoczeły
*/
		if @id_dzień > (
						 Select id_dzień 
						   from dbo.Numery_zleceń 
						  where Id_skier_wew = @id_skier_wew
						 )
			begin
				Select 'Zabiegi juz trwają. Nie można skasować ani dodać nowego zabiegu' as komunikat
			end
		else
			begin 
				declare @id_część_ciała as int
					set @id_część_ciała = (
											select ID_część_ciała 
											  from dbo.Części_ciała 
											 where Nazwa_części_ciała = @Nazwa_części_ciała
										  )
				declare @id_skrótu_nazwy_zabiegu as int
					set @id_skrótu_nazwy_zabiegu = (
													 select id_skrótu_nazwy_zabiegu 
													   from dbo.Skróty_nazw_zabiegów 
													  where skrót = @skrót_nazwy_zabiegu
												    )
/*
	Skasowanie zabiegu
*/
					delete from dbo.Zabiegi_zlecone
					where id_skier_wew = @id_skier_wew 
					and id_zabiegu = @id_skrótu_nazwy_zabiegu
					and id_część_ciała = @id_część_ciała
end
commit
		Select 'Zabieg skasowany. Dodaj nowe zabiegi przez proc:"Uzupełnij zabiegi"' as komunikat
end try 
begin catch
rollback
		select 'wycofano całość' as komunikat
end catch 