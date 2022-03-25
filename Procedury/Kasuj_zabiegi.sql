USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[kasuj_zabiegi]    Script Date: 25.03.2022 12:18:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Procedura ma za zadanie skasować zabie,który został przypisany pacjentowi w wyniku pomyłki
	Nie można już w ten sposób skasować zabiegu, gdy pacjent rozpocznie cykl.
*/

ALTER     proc [dbo].[kasuj_zabiegi]
@id_pacjenta as int ,
@skrót_nazwy_zabiegu as varchar(10),
@Nazwa_części_ciała as varchar(22)
as
begin try
begin tran
		begin
		declare @id_dzień as int
				set @id_dzień = (select id_dzień from dbo.Kalendarz where dzień = getdate())
		declare @id_skier_wew as int
				set @id_skier_wew = (select max(id_skier_wew) from dbo.Skierowania_wew where id_pacjenta = @id_pacjenta)
		end
		/*
				Procedura sprawdza czy zabiegi już się nie rozpoczeły
		*/
		if @id_dzień > (Select id_dzień from dbo.Numery_zleceń where Id_skier_wew = @id_skier_wew)
			begin
				rollback tran
				raiserror ('Zabiegi juz trwają. Nie można skasować ani dodać nowego zabiegu',9,1)
			end
		else
begin
begin 
		declare @id_część_ciała as int
		set @id_część_ciała = (select ID_część_ciała from dbo.Części_ciała where Nazwa_części_ciała = @Nazwa_części_ciała)
end
begin
		declare @id_skrótu_nazwy_zabiegu as int
		set @id_skrótu_nazwy_zabiegu = (select id_skrótu_nazwy_zabiegu from dbo.Skróty_nazw_zabiegów where skrót = @skrót_nazwy_zabiegu)
end
		/*
			Skasowanie zabiegu
		*/
begin
	delete from dbo.Zabiegi_zlecone
	where id_skier_wew = @id_skier_wew 
	and id_zabiegu = @id_skrótu_nazwy_zabiegu
	and id_część_ciała = @id_część_ciała
end
end
commit
print 'Zabieg skasowany. Dodaj nowe zabiegi przez proc:"Uzupełnij zabiegi"'
end try 
begin catch
rollback
print'wycofano całość'
end catch 