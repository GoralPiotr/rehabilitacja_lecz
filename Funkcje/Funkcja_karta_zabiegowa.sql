USE [leczenie_rehabilitacja]
GO
/****** Object:  UserDefinedFunction [dbo].[karta_zabiegowa1]    Script Date: 01.07.2022 13:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   function [dbo].[karta_zabiegowa1]
(@Numer_zlecenia as int)
Returns Table 
as
Return
			(
				with obliczenia as
					(
						select 0 as liczba
				     union all
			   select liczba+1 
			     from obliczenia
				where liczba < 9
				     ) 
				select distinct a.Nazwa_zabiegu
				     , a.Nazwa_części_ciała
					 , a.Strona_ciała
					 , a.Uwagi
					 , a.id_dzień+l.liczba as d
				     , k.dzień
				     , a.godziny
				 from obliczenia as l
		   cross join 
					(select zz.id_zabiegu
					      , nz.id_dzień
						  , zz.id_część_ciała
						  , zz.Id_strony_ciała
						  , Uwagi
						  , z.Nazwa_zabiegu
						  , cz.Nazwa_części_ciała
						  , sz.Strona_ciała
						  , gz.godziny
					   from dbo.numery_zleceń   as nz
				 inner join dbo.zabiegi_zlecone as zz
					     on nz.Id_skier_wew    = zz.Id_skier_wew
				 inner join zabiegi             as z
					     on z.Id_zabiegu       = zz.Id_zabiegu
				 inner join dbo.Części_ciała    as cz
					     on cz.Id_część_ciała  = zz.Id_część_ciała
				 inner join dbo.Strony_ciała    as sz
					     on sz.id_strony_ciała = zz.Id_strony_ciała
				 inner join Grupy_zabiegów      as gz
					     on gz.id_grupy        = nz.id_grupy
					  where nz.numer_zlecenia = @numer_zlecenia) as a
			inner join dbo.Kalendarz as k
					on k.id_dzień = a.id_dzień+l.liczba
					);
 

