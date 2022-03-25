USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[ustalenie_grafiku_rehabilitantów]    Script Date: 25.03.2022 12:25:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Za sprawą tej procedury jesteśmy wstanie stworzyć grafik rehabilitantów na dany miesiąc.
	Każdemy pracownikowi zostanie przypisany zabieg, który będzie odpowiedzialny,
	bez możlwiości zdublowania jego obowiązku w ciągu miesiąca.

*/
ALTER   proc [dbo].[ustalenie_grafiku_rehabilitantów]
@miesiąc as int,
@rok as int
WITH EXECUTE AS OWNER
as
begin try
begin tran 
begin
declare @data_grafiku as varchar(7)
set @data_grafiku = (concat(@rok,'-',@miesiąc))
-------------------------------------------------
	drop table if exists #tymczasowa
	create table #tymczasowa
	(id int identity,
	id_miejsca_zabiegu int,
	id_pracownika int,
	data_grafiku varchar(7)
	)
		drop table if exists #tym;
		create table #tym
		(
		id int identity,
		id_pracownika int
		) 
				insert into #tym (id_pracownika)
				select id_pracownika from dbo.Pracownicy
				where id_profesji = 3
				ORDER BY newId(); 
-------------------------------------------------
declare @id_miejsca_zabiegu as int = 0
declare @ilość_personelu_grupa as int = 1
while @id_miejsca_zabiegu <= (select max(id_miejsca_zabiegu) from dbo.Personel_zabiegi)
begin
	
		set @id_miejsca_zabiegu = @id_miejsca_zabiegu + 1
		while @ilość_personelu_grupa <= (select ilość_personelu_grupa from dbo.Personel_zabiegi where id_Miejsca_zabiegu = @id_miejsca_zabiegu)
		begin 
		insert into #tymczasowa (id_miejsca_zabiegu)
			values(@id_miejsca_zabiegu)
			set @ilość_personelu_grupa = @ilość_personelu_grupa+1
		end
		set @ilość_personelu_grupa = 1
end
declare @a as int = 1
while @a <= (select Count(*) from #tymczasowa)
begin
update #tymczasowa
set id_pracownika = (select id_pracownika from #tym where id = @a)
where id = @a
set @a = @a+1
end
update #tymczasowa
set data_grafiku = @data_grafiku
	insert into grafik_rehabilitantów
	select id_miejsca_zabiegu,id_pracownika,data_grafiku from #tymczasowa
end
-------------------------------------------------
end try
begin catch
rollback
print 'błąd - spróbuj ponownie'
;throw
end catch