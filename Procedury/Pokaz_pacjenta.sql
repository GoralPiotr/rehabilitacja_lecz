USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[pokaz_pacjenta]    Script Date: 29.06.2022 15:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Procedura pokazuje dane o pacjencie
*/
ALTER   proc [dbo].[pokaz_pacjenta]
(
@id_pacjenta as int = null,
@pesel as char(11) = 'brak'
)
WITH EXECUTE AS OWNER
as
begin
	declare @zapytanie as nvarchar(max)
	set @zapytanie = 
	 'Select Id_pacjenta
		   , Imię
		   , Nazwisko
		   , Telefon
		   , Email 
		from dbo.Pacjenci 
	   where Id_pacjenta = @Id_pacjenta 
;
	  select sz.id_pacjenta
	       , c.Nazwa_części_ciała
		   , sz.Data_wystawienia
		   , sz.uwagi 
        from dbo.Skierowania_zew as sz
  inner join dbo.Części_ciała as c
          on c.Id_część_ciała = sz.Id_część_ciała
       where sz.Id_skier_zew in 
							  (
							    Select z.Id_skier_zew 
								  from dbo.Skierowania_zew as z
							     where z.id_pacjenta = @id_pacjenta
							  )
;
	  select top 3 pp.id_pracownika
	       , pp.Imię_pracownika
		   , pp.Nazwisko_pracownika
		   , ppp.Nazwa_profesji
		   , dzień as dzień_wizyty
		   , id_miejsce 
	    from dbo.Wizyty           as w
  inner join dbo.Grafik_Lek_fizjo as g
          on g.Id_pracy = w.Id_pracy
  inner join dbo.Kalendarz        as k
         on k.id_dzień = g.Id_dzień
 inner join dbo.Pracownicy        as pp
         on pp.id_pracownika = g.id_pracownika
 inner join dbo.Profesje         as ppp
         on ppp.Id_profesji = pp.Id_profesji
      where w.id_pacjenta = @id_pacjenta
   order by dzień desc
;
	 select tabela.Numer_zlecenia
	      , STRING_AGG(dzień, '' - '') as dni_zabiegów 
	   from Kalendarz
 inner join 
		   (
			 select nz.Numer_zlecenia
                  , nz.Id_skier_wew
                  , pora_dnia
				  , wartość
               from Numery_zleceń as nz
        cross apply (values (Id_dzień,''Początek''),(Id_dzień+9,''Koniec'')) as A(pora_dnia,wartość)
         inner join Skierowania_wew as sw
                 on sw.Id_skier_wew  = nz.Id_skier_wew
              where Id_pacjenta = @Id_pacjenta
          ) as tabela 
         on tabela.pora_dnia = Kalendarz.id_dzień
   group by tabela.Numer_zlecenia
   order by tabela.Numer_zlecenia desc
;
	select sw.id_skier_wew
	     , sc.Strona_ciała
		 , u.Kod_urazu
		 , id_pracownika
		 , string_agg(skrót,'','') as zabieg
		 , Nazwa_części_ciała 
	  from dbo.Zabiegi_zlecone as zz 
inner join dbo.Skierowania_wew as sw
		on zz.Id_skier_wew             = sw.Id_skier_wew
inner join dbo.Zabiegi as z
		on z.Id_zabiegu                = zz.Id_zabiegu
inner join dbo.Skróty_nazw_zabiegów as snz
		on snz.id_skrótu_nazwy_zabiegu = z.Id_skrótu_nazwy_zabiegu
inner join dbo.Części_ciała as cc
		on cc.Id_część_ciała           = zz.Id_część_ciała
inner join dbo.strony_ciała as sc 
		on sc.id_strony_ciała          = zz.Id_strony_ciała
inner join dbo.Urazy as u
		on u.Id_urazu     = zz.Id_urazu
	 where sw.id_pacjenta = @id_pacjenta
  group by sw.id_skier_wew,sc.Strona_ciała,u.Kod_urazu,id_pracownika,Nazwa_części_ciała
  order by id_skier_wew desc'
;
exec sp_executesql
	@stmt = @zapytanie,
	@params = N'@Id_pacjenta nvarchar(6)',
	@id_pacjenta = @id_pacjenta
end