USE [leczenie_rehabilitacja]
GO
/****** Object:  StoredProcedure [dbo].[uzupełnij_zabiegi]    Script Date: 13.03.2022 14:53:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   proc [dbo].[uzupełnij_zabiegi]
(
@id_pacjenta as int,
@zabieg1 as varchar(100),
@zabieg2 as varchar(100) = null,
@zabieg3 as varchar(100) = null,
@zabieg4 as varchar(100) = null,
@zabieg5 as varchar(100) = null
)
WITH EXECUTE AS OWNER
as
begin tran
begin try
begin 
		begin
		declare @id_dzień as int
				set @id_dzień = (select id_dzień from dbo.Kalendarz where dzień = getdate())
		declare @id_skier_wew as int
				set @id_skier_wew = (select max(id_skier_wew) from dbo.Skierowania_wew where id_pacjenta = @id_pacjenta)
		end
		if @id_dzień > (Select id_dzień from dbo.Numery_zleceń where Id_skier_wew = @id_skier_wew)
			begin
				rollback tran
				raiserror ('Zabiegi juz trwają. Nie można skasować ani dodać nowego zabiegu',9,1)
			end
		else
		begin
		create table #zabiegi
		(
			id int identity(1,1),
			Zabieg varchar(100)
		)
			insert into #zabiegi (zabieg)
			values(@zabieg1),(@zabieg2),(@zabieg3),(@zabieg4),(@zabieg5)
		create table #zabiegi2
		(
		id int,
		nr int,
		zabieg varchar(20)
		)
		insert into #zabiegi2
		select  id,row_number () over (partition by id order by id) as nr,zabieg
		from 
		(
				select id, value as zabieg from #zabiegi
				cross apply string_split(zabieg,',')
		) as b
		select zabieg into #uwagi from #zabiegi2
		where nr = 5
			insert into zabiegi_zlecone (Id_skier_wew,Id_część_ciała,Id_zabiegu,Id_strony_ciała,Id_urazu,Uwagi)		
			Select  distinct id_skierowania_wew, cc.Id_część_ciała ,sa.id_skrótu_nazwy_zabiegu,sc.id_strony_ciała,
			u.Id_urazu,piv.Uwagi
			from 
			(
			select @id_skier_wew as id_skierowania_wew 
			,[1] as Id_część_ciała ,[2] as Id_zabiegu,[3] as Id_strony_ciała ,[4] Id_urazu,[5] as Uwagi
			 from (select id,nr,zabieg from 
				(
					select 
					  z.id
					 ,z.nr
					 ,z.zabieg
					 from #zabiegi2 as z
				) as C
				) as B
				Pivot (max(zabieg) for nr IN ([1], [2], [3], [4], [5])) As p
				) as piv
		left join dbo.Części_ciała as cc
        on cc.Nazwa_części_ciała = piv.Id_część_ciała
		left join dbo.Skróty_nazw_zabiegów as sa
		on sa.Skrót = piv.Id_zabiegu
		left join dbo.Strony_ciała as sc
		on sc.Strona_ciała = piv.Id_strony_ciała
		left join dbo.Urazy as u
		on u.Kod_urazu = piv.Id_urazu
		left join #uwagi as uw
		on uw.zabieg = piv.Uwagi
end
end

drop table #zabiegi
drop table #zabiegi2
drop table #uwagi
commit
end try 
begin catch
rollback
print'Uzupełnij zabiegi'
declare @id as int set @id = (select MAX(id_zabiegu_zleconego) from Zabiegi_zlecone)
dbcc checkident ('Zabiegi_zlecone', reseed, @id)
;throw
end catch 