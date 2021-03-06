USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[ustalenie_grafiku_rehabilitantów]    Script Date: 28.06.2022 19:38:21 ******/
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
declare @grafik_reh as grafik
declare @dod_prac as rehabilitanci 
declare @data_grafiku as varchar(7)
	set @data_grafiku = (concat(@rok,'-',@miesiąc))
---- dodanie do zmiennej tabelarycznej @grafik_reh pomieszczeń gdzie 
---- wykonywane są zabiegi z uwzględnieniem ilość osób do obługi
;with obliczenia as
		( 
			select id_miejsca_zabiegu
			     , ilość_personelu_grupa
				 , 1 as liczba 
			  from personel_zabiegi
		 union all 
		    select id_miejsca_zabiegu
			     , ilość_personelu_grupa
				 , liczba+1 
			  from obliczenia
		     where liczba+1 <= ilość_personelu_grupa
		) 
 insert into @grafik_reh (id_miejsca_zabiegu,miesiąc_rok)
	  select id_miejsca_zabiegu
	       , @data_grafiku 
		from obliczenia
	order by id_miejsca_zabiegu
--Dodanie rehabilitantów do zmiennej tabelarycznej @dod_prac w celu zapewnienia losowości
 insert into @dod_prac
      select id_pracownika 
	    from dbo.Pracownicy
       where id_profesji = 3
    ORDER BY newId(); 
----Uzupełenienie zmiennej tabelarycznej @grafik_reh o losowo przyporządkowanych pracowników
update @grafik_reh
set id_pracownika = 
				            r.id_pracownika 
					   from @dod_prac as r
				 inner join @grafik_reh as g
					     on r.id = g.id				 
---- uzupełnienie tabeli Grafik_rehabilitantów o dane ze zmiennej tabelarycznej @grafik_reh
insert into Grafik_rehabilitantów
     select id_miejsca_zabiegu
		  , id_pracownika
		  , miesiąc_rok
       from @grafik_reh
commit
end try
begin catch
rollback
print 'błąd - spróbuj ponownie'
;throw
end catch