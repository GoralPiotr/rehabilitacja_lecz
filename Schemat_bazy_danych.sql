USE [master]
GO
/****** Object:  Database [leczenie_rehabilitacja]    Script Date: 01.07.2022 14:34:33 ******/
CREATE DATABASE [leczenie_rehabilitacja]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'leczenie_rehabilitacja', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\leczenie_rehabilitacja.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'leczenie_rehabilitacja_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\leczenie_rehabilitacja_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [leczenie_rehabilitacja] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [leczenie_rehabilitacja].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [leczenie_rehabilitacja] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET ARITHABORT OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET  ENABLE_BROKER 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET RECOVERY FULL 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET  MULTI_USER 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [leczenie_rehabilitacja] SET DB_CHAINING OFF 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [leczenie_rehabilitacja] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'leczenie_rehabilitacja', N'ON'
GO
ALTER DATABASE [leczenie_rehabilitacja] SET QUERY_STORE = OFF
GO
USE [leczenie_rehabilitacja]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
USE [leczenie_rehabilitacja]
GO
/****** Object:  User [ZofiaRasa]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [ZofiaRasa] FOR LOGIN [ZofiaRasa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [WeronikaMac]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [WeronikaMac] FOR LOGIN [WeronikaMac] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [RobertPuma]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [RobertPuma] FOR LOGIN [RobertPuma] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PiotrPor]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [PiotrPor] FOR LOGIN [PiotrPor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PawełBęc]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [PawełBęc] FOR LOGIN [PawełBęc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MikołajMere]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [MikołajMere] FOR LOGIN [MikołajMere] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MichałBauer]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [MichałBauer] FOR LOGIN [MichałBauer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MichałAra]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [MichałAra] FOR LOGIN [MichałAra] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MartaPasan]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [MartaPasan] FOR LOGIN [MartaPasan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MariolaKirit]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [MariolaKirit] FOR LOGIN [MariolaKirit] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MariaJopek]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [MariaJopek] FOR LOGIN [MariaJopek] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ŁukaszOko]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [ŁukaszOko] FOR LOGIN [ŁukaszOko] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ŁukaszMor]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [ŁukaszMor] FOR LOGIN [ŁukaszMor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ŁukaszMamas]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [ŁukaszMamas] FOR LOGIN [ŁukaszMamas] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ŁukaszLama]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [ŁukaszLama] FOR LOGIN [ŁukaszLama] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ŁukaszIzydor]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [ŁukaszIzydor] FOR LOGIN [ŁukaszIzydor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KarolinaRak]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [KarolinaRak] FOR LOGIN [KarolinaRak] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KamilBaal]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [KamilBaal] FOR LOGIN [KamilBaal] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JoannaKeja]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [JoannaKeja] FOR LOGIN [JoannaKeja] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JoannaBez]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [JoannaBez] FOR LOGIN [JoannaBez] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DawidMasan]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [DawidMasan] FOR LOGIN [DawidMasan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DaielPej]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [DaielPej] FOR LOGIN [DaielPej] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AnnaKawi]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [AnnaKawi] FOR LOGIN [AnnaKawi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AlicjaKolas]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [AlicjaKolas] FOR LOGIN [AlicjaKolas] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AlicjaEka]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [AlicjaEka] FOR LOGIN [AlicjaEka] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdrianRau]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [AdrianRau] FOR LOGIN [AdrianRau] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdamKotra]    Script Date: 01.07.2022 14:34:34 ******/
CREATE USER [AdamKotra] FOR LOGIN [AdamKotra] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [Rehabilitanci]    Script Date: 01.07.2022 14:34:34 ******/
CREATE ROLE [Rehabilitanci]
GO
/****** Object:  DatabaseRole [Recepcjonista]    Script Date: 01.07.2022 14:34:34 ******/
CREATE ROLE [Recepcjonista]
GO
/****** Object:  DatabaseRole [Fizjoterapeuci]    Script Date: 01.07.2022 14:34:34 ******/
CREATE ROLE [Fizjoterapeuci]
GO
/****** Object:  DatabaseRole [Diagnoza_lekarska]    Script Date: 01.07.2022 14:34:34 ******/
CREATE ROLE [Diagnoza_lekarska]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [ZofiaRasa]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [WeronikaMac]
GO
ALTER ROLE [Recepcjonista] ADD MEMBER [RobertPuma]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [PiotrPor]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [PawełBęc]
GO
ALTER ROLE [Recepcjonista] ADD MEMBER [MikołajMere]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [MichałBauer]
GO
ALTER ROLE [Diagnoza_lekarska] ADD MEMBER [MichałAra]
GO
ALTER ROLE [Recepcjonista] ADD MEMBER [MartaPasan]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [MariolaKirit]
GO
ALTER ROLE [Fizjoterapeuci] ADD MEMBER [MariaJopek]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [ŁukaszOko]
GO
ALTER ROLE [Diagnoza_lekarska] ADD MEMBER [ŁukaszMor]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [ŁukaszMamas]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [ŁukaszLama]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [ŁukaszIzydor]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [KarolinaRak]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [KamilBaal]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [JoannaKeja]
GO
ALTER ROLE [Diagnoza_lekarska] ADD MEMBER [JoannaBez]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [DawidMasan]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [DaielPej]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [AnnaKawi]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [AlicjaKolas]
GO
ALTER ROLE [Recepcjonista] ADD MEMBER [AlicjaEka]
GO
ALTER ROLE [Rehabilitanci] ADD MEMBER [AdrianRau]
GO
ALTER ROLE [Fizjoterapeuci] ADD MEMBER [AdamKotra]
GO
/****** Object:  UserDefinedTableType [dbo].[grafik]    Script Date: 01.07.2022 14:34:36 ******/
CREATE TYPE [dbo].[grafik] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_miejsca_zabiegu] [int] NULL,
	[id_pracownika] [int] NULL,
	[miesiąc_rok] [varchar](7) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[rehabilitanci]    Script Date: 01.07.2022 14:34:36 ******/
CREATE TYPE [dbo].[rehabilitanci] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pracownika] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[zabiegi]    Script Date: 01.07.2022 14:34:36 ******/
CREATE TYPE [dbo].[zabiegi] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Zabieg] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[dni_zabiegów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   function [dbo].[dni_zabiegów]
(@id_dzień as smallint)
returns int
as
begin
declare @max_dzień as smallint
set @max_dzień = (@id_dzień +5)
return @max_dzień
end 
GO
/****** Object:  UserDefinedFunction [dbo].[pokaż_dni]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   function [dbo].[pokaż_dni] 
(@id_dzień as int)
returns int
as begin 
declare @id_dnia as int
set @id_dnia = @id_dzień
while @id_dnia <= @id_dnia+10
begin
	set @id_dnia = @id_dnia+1
end 
return @id_dnia
end
GO
/****** Object:  Table [dbo].[Strony_ciała]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strony_ciała](
	[id_strony_ciała] [smallint] IDENTITY(1,1) NOT NULL,
	[Strona_ciała] [varchar](1) NULL,
 CONSTRAINT [pk_id_strony_ciała] PRIMARY KEY CLUSTERED 
(
	[id_strony_ciała] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zabiegi_zlecone]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zabiegi_zlecone](
	[Id_zabiegu_zleconego] [int] IDENTITY(1,1) NOT NULL,
	[Id_skier_wew] [int] NOT NULL,
	[Id_część_ciała] [smallint] NOT NULL,
	[Id_zabiegu] [smallint] NOT NULL,
	[Id_strony_ciała] [smallint] NOT NULL,
	[Id_urazu] [smallint] NOT NULL,
	[Uwagi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_zabiegu_zleconego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Zab_unikalne] UNIQUE NONCLUSTERED 
(
	[Id_skier_wew] ASC,
	[Id_część_ciała] ASC,
	[Id_zabiegu] ASC,
	[Id_strony_ciała] ASC,
	[Id_urazu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupy_zabiegów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupy_zabiegów](
	[id_grupy] [smallint] IDENTITY(1,1) NOT NULL,
	[godziny] [char](11) NULL,
	[nazwa] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_grupy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Części_ciała]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Części_ciała](
	[Id_część_ciała] [smallint] IDENTITY(1,1) NOT NULL,
	[Nazwa_części_ciała] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_część_ciała] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zabiegi]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zabiegi](
	[Id_zabiegu] [smallint] IDENTITY(1,1) NOT NULL,
	[Nazwa_zabiegu] [varchar](50) NOT NULL,
	[Id_skrótu_nazwy_zabiegu] [smallint] NOT NULL,
	[Id_miejsca_zabiegu] [smallint] NOT NULL,
	[max_ilość_grupa] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_zabiegu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kalendarz]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kalendarz](
	[id_dzień] [int] IDENTITY(1,1) NOT NULL,
	[dzień] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_dzień] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Numery_zleceń]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Numery_zleceń](
	[Numer_zlecenia] [int] IDENTITY(1,1) NOT NULL,
	[Id_skier_wew] [int] NOT NULL,
	[Id_pracownika] [smallint] NOT NULL,
	[Id_dzień] [int] NOT NULL,
	[Id_grupy] [smallint] NOT NULL,
	[data_wystawienia] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Numer_zlecenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [skier_wew_unikalne] UNIQUE NONCLUSTERED 
(
	[Id_skier_wew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[karta_zabiegowa1]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   function [dbo].[karta_zabiegowa1]
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
 

GO
/****** Object:  UserDefinedFunction [dbo].[kolejny_tydzień]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Funkcja inline dodaje 5 dni od rozpoczęcia dnia zabiegowego.
Funkcja niezbędna do wyliczenia ilości osób na zabiegach. 
*/
CREATE   function [dbo].[kolejny_tydzień] 
(
@numer_zlecenia as int
)
Returns table
as
return
select numer_zlecenia, id_skier_wew, id_pracownika, id_dzień+5 as id_dzień, id_grupy,data_wystawienia from Numery_zleceń
where numer_zlecenia = @numer_zlecenia
GO
/****** Object:  Table [dbo].[Kalendarz_zabiegowy]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kalendarz_zabiegowy](
	[id_k_z] [int] IDENTITY(1,1) NOT NULL,
	[id_zabiegu] [smallint] NULL,
	[id_grupy] [smallint] NULL,
	[id_dzień] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_k_z] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[liczenie_zabiegów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create    view [dbo].[liczenie_zabiegów]
as
select kz.id_dzień,kz.id_zabiegu,kz.id_grupy,count(a.id_zabiegu) as ilość_wykorzystanych
from kalendarz_zabiegowy as kz
inner join Zabiegi as z
on kz.id_zabiegu = z.Id_zabiegu
	left join 
	(
			select zz.id_zabiegu,b.Id_grupy,b.Id_dzień from (
			select * from Numery_zleceń
			union
			select l.* from Numery_zleceń
			cross apply dbo.kolejny_tydzień(numer_zlecenia) as l) as b
			inner join Zabiegi_zlecone as zz 
			on zz.Id_skier_wew = b.Id_skier_wew
	) as a
on a.id_zabiegu = kz.id_zabiegu
and kz.id_grupy = a.id_grupy
and kz.id_dzień = a.id_dzień
group by kz.id_k_z,kz.id_dzień,kz.id_zabiegu,kz.id_grupy
GO
/****** Object:  View [dbo].[wykorzystanie_zabiegów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[wykorzystanie_zabiegów] as
select lz.id_dzień,z.Nazwa_zabiegu,lz.id_grupy,lz.ilość_wykorzystanych,z.max_ilość_grupa,k.dzień from liczenie_zabiegów as lz
inner join kalendarz as k
on lz.id_dzień = k.id_dzień 
inner join zabiegi as z
on z.Id_zabiegu = lz.id_zabiegu
GO
/****** Object:  UserDefinedFunction [dbo].[f_karta_zabiegowa]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Funkcja Inline pokazuje kartę zabiegową pacjenta 
*/
create     function [dbo].[f_karta_zabiegowa]
(@Numer_zlecenia as int)
Returns Table 
as
Return(
with obliczenia as
(
select 0 as liczba
union all
select liczba+1 from obliczenia
where liczba < 9
) 
select distinct a.Nazwa_zabiegu,a.Nazwa_części_ciała,a.Strona_ciała,a.Uwagi,a.id_dzień+l.liczba as d
,k.dzień
,a.godziny
from obliczenia as l
cross join 
(select zz.id_zabiegu,nz.id_dzień,zz.id_część_ciała,zz.Id_strony_ciała,Uwagi,
z.Nazwa_zabiegu,cz.Nazwa_części_ciała,sz.Strona_ciała,gz.godziny
from dbo.numery_zleceń nz
inner join dbo.zabiegi_zlecone as zz
on nz.Id_skier_wew = zz.Id_skier_wew
inner join zabiegi as z
on z.Id_zabiegu = zz.Id_zabiegu
inner join dbo.Części_ciała as cz
on cz.Id_część_ciała = zz.Id_część_ciała
inner join dbo.Strony_ciała as sz
on sz.id_strony_ciała = zz.Id_strony_ciała
inner join Grupy_zabiegów as gz
on gz.id_grupy = nz.id_grupy
where nz.numer_zlecenia = @numer_zlecenia) as a
inner join dbo.Kalendarz as k
on k.id_dzień = a.id_dzień+l.liczba
);
 

GO
/****** Object:  Table [dbo].[Grafik_Lek_fizjo]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grafik_Lek_fizjo](
	[Id_pracy] [int] IDENTITY(1,1) NOT NULL,
	[Id_pracownika] [smallint] NULL,
	[Id_dzień] [int] NULL,
	[Id_miejsce] [int] NULL,
	[Id_status] [int] NULL,
	[ilość_pacjentów] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_pracy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grafik_recepcja]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grafik_recepcja](
	[id_pracownika] [smallint] NULL,
	[id_dzień] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grafik_rehabilitantów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grafik_rehabilitantów](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_miejsca_zabiegu] [smallint] NULL,
	[id_pracownika] [smallint] NULL,
	[miesiąc_rok] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liczby]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liczby](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacjenci]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacjenci](
	[Id_pacjenta] [int] IDENTITY(1,1) NOT NULL,
	[Imię] [varchar](15) NOT NULL,
	[Nazwisko] [varchar](30) NOT NULL,
	[Pesel] [char](11) NOT NULL,
	[Telefon] [varchar](11) NULL,
	[Email] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_pacjenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unikalny] UNIQUE NONCLUSTERED 
(
	[Pesel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel_zabiegi]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel_zabiegi](
	[id_miejsca_zabiegu] [smallint] NOT NULL,
	[ilość_personelu_grupa] [int] NULL,
 CONSTRAINT [id_miejsca_zabiegu_pz] PRIMARY KEY CLUSTERED 
(
	[id_miejsca_zabiegu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[Id_pracownika] [smallint] IDENTITY(1,1) NOT NULL,
	[Imię_pracownika] [varchar](20) NOT NULL,
	[Nazwisko_pracownika] [varchar](30) NOT NULL,
	[Id_profesji] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_pracownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesje]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesje](
	[Id_profesji] [smallint] IDENTITY(1,1) NOT NULL,
	[Nazwa_profesji] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_profesji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skasowane_numery_zleceń]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skasowane_numery_zleceń](
	[id_skasowanego_nr_zlecenia] [smallint] IDENTITY(1,1) NOT NULL,
	[id_skier_wew] [int] NULL,
	[id_pracownika] [smallint] NULL,
	[id_grupy] [smallint] NULL,
	[data_skasowania] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_skasowanego_nr_zlecenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skasowane_skierowania]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skasowane_skierowania](
	[id_skasowanego_skierowania] [int] IDENTITY(1,1) NOT NULL,
	[id_skier_wew] [int] NULL,
	[id_pacjenta] [int] NULL,
	[id_pracownika_wystawiajacego] [int] NULL,
	[data] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_skasowanego_skierowania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skasowane_zabiegi]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skasowane_zabiegi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_skier_wew] [int] NULL,
	[id_część_ciała] [smallint] NULL,
	[id_zabiegu] [smallint] NULL,
	[id_strony_ciała] [smallint] NULL,
	[id_urazu] [smallint] NULL,
	[data_skasowania] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skierowania_wew]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skierowania_wew](
	[Id_skier_wew] [int] IDENTITY(1,1) NOT NULL,
	[Nr_skier_wew] [varchar](20) NOT NULL,
	[Id_pacjenta] [int] NOT NULL,
	[Id_pracownika] [smallint] NOT NULL,
	[Data_wystawienia] [smalldatetime] NULL,
 CONSTRAINT [PK__Skierowa__E85C9113BE1FAAC3] PRIMARY KEY CLUSTERED 
(
	[Id_skier_wew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unikalnysw] UNIQUE NONCLUSTERED 
(
	[Nr_skier_wew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skierowania_zew]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skierowania_zew](
	[Id_skier_zew] [int] IDENTITY(1,1) NOT NULL,
	[Nr_skier_zew] [int] NULL,
	[Data_wystawienia] [date] NULL,
	[Id_pacjenta] [int] NULL,
	[Id_część_ciała] [smallint] NOT NULL,
	[Data_wpisania_skier_zew] [smalldatetime] NULL,
	[Uwagi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_skier_zew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skróty_nazw_zabiegów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skróty_nazw_zabiegów](
	[id_skrótu_nazwy_zabiegu] [smallint] IDENTITY(1,1) NOT NULL,
	[Skrót] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_skrótu_nazwy_zabiegu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specjalizacje]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specjalizacje](
	[Id_pracownika] [smallint] NULL,
	[Id_część_ciała] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urazy]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urazy](
	[Id_urazu] [smallint] IDENTITY(1,1) NOT NULL,
	[Kod_urazu] [varchar](6) NOT NULL,
	[Nazwa_urazu] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_urazu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wagi]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wagi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[waga] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wizyty]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wizyty](
	[Id_wizyty] [int] IDENTITY(1,1) NOT NULL,
	[Id_pacjenta] [int] NULL,
	[Id_pracy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_wizyty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [kdzień]    Script Date: 01.07.2022 14:34:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [kdzień] ON [dbo].[Kalendarz]
(
	[dzień] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [skier_zew_id_pac_id_skier]    Script Date: 01.07.2022 14:34:36 ******/
CREATE NONCLUSTERED INDEX [skier_zew_id_pac_id_skier] ON [dbo].[Skierowania_zew]
(
	[Id_pacjenta] ASC,
	[Id_skier_zew] ASC,
	[Id_część_ciała] ASC
)
INCLUDE([Data_wystawienia],[Uwagi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [skier_zew_nr]    Script Date: 01.07.2022 14:34:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [skier_zew_nr] ON [dbo].[Skierowania_zew]
(
	[Nr_skier_zew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Wizyty_id_pracy]    Script Date: 01.07.2022 14:34:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Wizyty_id_pracy] ON [dbo].[Wizyty]
(
	[Id_pacjenta] ASC,
	[Id_pracy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Numery_zleceń] ADD  CONSTRAINT [data_wpis]  DEFAULT (getdate()) FOR [data_wystawienia]
GO
ALTER TABLE [dbo].[Pacjenci] ADD  CONSTRAINT [brak_tel]  DEFAULT ('brak') FOR [Telefon]
GO
ALTER TABLE [dbo].[Pacjenci] ADD  CONSTRAINT [brak_email]  DEFAULT ('brak') FOR [Email]
GO
ALTER TABLE [dbo].[Skasowane_numery_zleceń] ADD  DEFAULT (getdate()) FOR [data_skasowania]
GO
ALTER TABLE [dbo].[Skasowane_skierowania] ADD  DEFAULT (getdate()) FOR [data]
GO
ALTER TABLE [dbo].[Skasowane_zabiegi] ADD  DEFAULT (getdate()) FOR [data_skasowania]
GO
ALTER TABLE [dbo].[Skierowania_wew] ADD  CONSTRAINT [data_d]  DEFAULT (getdate()) FOR [Data_wystawienia]
GO
ALTER TABLE [dbo].[Skierowania_zew] ADD  CONSTRAINT [dziensz]  DEFAULT (getdate()) FOR [Data_wpisania_skier_zew]
GO
ALTER TABLE [dbo].[Skierowania_zew] ADD  CONSTRAINT [brak_sk_zew]  DEFAULT ('brak') FOR [Uwagi]
GO
ALTER TABLE [dbo].[Grafik_Lek_fizjo]  WITH CHECK ADD  CONSTRAINT [id_dzień_g] FOREIGN KEY([Id_dzień])
REFERENCES [dbo].[Kalendarz] ([id_dzień])
GO
ALTER TABLE [dbo].[Grafik_Lek_fizjo] CHECK CONSTRAINT [id_dzień_g]
GO
ALTER TABLE [dbo].[Grafik_Lek_fizjo]  WITH CHECK ADD  CONSTRAINT [id_pracownika_g] FOREIGN KEY([Id_pracownika])
REFERENCES [dbo].[Pracownicy] ([Id_pracownika])
GO
ALTER TABLE [dbo].[Grafik_Lek_fizjo] CHECK CONSTRAINT [id_pracownika_g]
GO
ALTER TABLE [dbo].[Grafik_recepcja]  WITH CHECK ADD FOREIGN KEY([id_pracownika])
REFERENCES [dbo].[Pracownicy] ([Id_pracownika])
GO
ALTER TABLE [dbo].[Grafik_recepcja]  WITH CHECK ADD FOREIGN KEY([id_dzień])
REFERENCES [dbo].[Kalendarz] ([id_dzień])
GO
ALTER TABLE [dbo].[Grafik_rehabilitantów]  WITH CHECK ADD  CONSTRAINT [Id_miejsca_zabiegu_gr] FOREIGN KEY([id_miejsca_zabiegu])
REFERENCES [dbo].[Personel_zabiegi] ([id_miejsca_zabiegu])
GO
ALTER TABLE [dbo].[Grafik_rehabilitantów] CHECK CONSTRAINT [Id_miejsca_zabiegu_gr]
GO
ALTER TABLE [dbo].[Grafik_rehabilitantów]  WITH CHECK ADD  CONSTRAINT [id_pracownika_gr] FOREIGN KEY([id_pracownika])
REFERENCES [dbo].[Pracownicy] ([Id_pracownika])
GO
ALTER TABLE [dbo].[Grafik_rehabilitantów] CHECK CONSTRAINT [id_pracownika_gr]
GO
ALTER TABLE [dbo].[Kalendarz_zabiegowy]  WITH CHECK ADD  CONSTRAINT [id_dzień_kz] FOREIGN KEY([id_dzień])
REFERENCES [dbo].[Kalendarz] ([id_dzień])
GO
ALTER TABLE [dbo].[Kalendarz_zabiegowy] CHECK CONSTRAINT [id_dzień_kz]
GO
ALTER TABLE [dbo].[Kalendarz_zabiegowy]  WITH CHECK ADD  CONSTRAINT [id_grupy_kz] FOREIGN KEY([id_grupy])
REFERENCES [dbo].[Grupy_zabiegów] ([id_grupy])
GO
ALTER TABLE [dbo].[Kalendarz_zabiegowy] CHECK CONSTRAINT [id_grupy_kz]
GO
ALTER TABLE [dbo].[Kalendarz_zabiegowy]  WITH CHECK ADD  CONSTRAINT [Id_zabiegu_kz] FOREIGN KEY([id_zabiegu])
REFERENCES [dbo].[Zabiegi] ([Id_zabiegu])
GO
ALTER TABLE [dbo].[Kalendarz_zabiegowy] CHECK CONSTRAINT [Id_zabiegu_kz]
GO
ALTER TABLE [dbo].[Numery_zleceń]  WITH CHECK ADD  CONSTRAINT [id_dzień_nz] FOREIGN KEY([Id_dzień])
REFERENCES [dbo].[Kalendarz] ([id_dzień])
GO
ALTER TABLE [dbo].[Numery_zleceń] CHECK CONSTRAINT [id_dzień_nz]
GO
ALTER TABLE [dbo].[Numery_zleceń]  WITH CHECK ADD  CONSTRAINT [id_grupy_g] FOREIGN KEY([Id_grupy])
REFERENCES [dbo].[Grupy_zabiegów] ([id_grupy])
GO
ALTER TABLE [dbo].[Numery_zleceń] CHECK CONSTRAINT [id_grupy_g]
GO
ALTER TABLE [dbo].[Numery_zleceń]  WITH CHECK ADD  CONSTRAINT [id_pracownika_nz] FOREIGN KEY([Id_pracownika])
REFERENCES [dbo].[Pracownicy] ([Id_pracownika])
GO
ALTER TABLE [dbo].[Numery_zleceń] CHECK CONSTRAINT [id_pracownika_nz]
GO
ALTER TABLE [dbo].[Numery_zleceń]  WITH CHECK ADD  CONSTRAINT [id_skier_wew_nz] FOREIGN KEY([Id_skier_wew])
REFERENCES [dbo].[Skierowania_wew] ([Id_skier_wew])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Numery_zleceń] CHECK CONSTRAINT [id_skier_wew_nz]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [Id_profesji_p] FOREIGN KEY([Id_profesji])
REFERENCES [dbo].[Profesje] ([Id_profesji])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [Id_profesji_p]
GO
ALTER TABLE [dbo].[Skierowania_wew]  WITH CHECK ADD  CONSTRAINT [id_pacjenta_sw] FOREIGN KEY([Id_pacjenta])
REFERENCES [dbo].[Pacjenci] ([Id_pacjenta])
GO
ALTER TABLE [dbo].[Skierowania_wew] CHECK CONSTRAINT [id_pacjenta_sw]
GO
ALTER TABLE [dbo].[Skierowania_wew]  WITH CHECK ADD  CONSTRAINT [id_pracownika_sw] FOREIGN KEY([Id_pracownika])
REFERENCES [dbo].[Pracownicy] ([Id_pracownika])
GO
ALTER TABLE [dbo].[Skierowania_wew] CHECK CONSTRAINT [id_pracownika_sw]
GO
ALTER TABLE [dbo].[Skierowania_zew]  WITH CHECK ADD  CONSTRAINT [id_pacjenta_sz] FOREIGN KEY([Id_pacjenta])
REFERENCES [dbo].[Pacjenci] ([Id_pacjenta])
GO
ALTER TABLE [dbo].[Skierowania_zew] CHECK CONSTRAINT [id_pacjenta_sz]
GO
ALTER TABLE [dbo].[Specjalizacje]  WITH CHECK ADD  CONSTRAINT [id_pracownika_s] FOREIGN KEY([Id_pracownika])
REFERENCES [dbo].[Pracownicy] ([Id_pracownika])
GO
ALTER TABLE [dbo].[Specjalizacje] CHECK CONSTRAINT [id_pracownika_s]
GO
ALTER TABLE [dbo].[Wizyty]  WITH CHECK ADD  CONSTRAINT [id_pacjenta_w] FOREIGN KEY([Id_pacjenta])
REFERENCES [dbo].[Pacjenci] ([Id_pacjenta])
GO
ALTER TABLE [dbo].[Wizyty] CHECK CONSTRAINT [id_pacjenta_w]
GO
ALTER TABLE [dbo].[Wizyty]  WITH CHECK ADD  CONSTRAINT [id_pracy_w] FOREIGN KEY([Id_pracy])
REFERENCES [dbo].[Grafik_Lek_fizjo] ([Id_pracy])
GO
ALTER TABLE [dbo].[Wizyty] CHECK CONSTRAINT [id_pracy_w]
GO
ALTER TABLE [dbo].[Zabiegi]  WITH CHECK ADD  CONSTRAINT [Id_miejsca_zabiegu_z] FOREIGN KEY([Id_miejsca_zabiegu])
REFERENCES [dbo].[Personel_zabiegi] ([id_miejsca_zabiegu])
GO
ALTER TABLE [dbo].[Zabiegi] CHECK CONSTRAINT [Id_miejsca_zabiegu_z]
GO
ALTER TABLE [dbo].[Zabiegi]  WITH CHECK ADD  CONSTRAINT [Id_skrótu_nazwy_zabiegu_z] FOREIGN KEY([Id_skrótu_nazwy_zabiegu])
REFERENCES [dbo].[Skróty_nazw_zabiegów] ([id_skrótu_nazwy_zabiegu])
GO
ALTER TABLE [dbo].[Zabiegi] CHECK CONSTRAINT [Id_skrótu_nazwy_zabiegu_z]
GO
ALTER TABLE [dbo].[Zabiegi_zlecone]  WITH CHECK ADD  CONSTRAINT [id_część_ciała_zz] FOREIGN KEY([Id_część_ciała])
REFERENCES [dbo].[Części_ciała] ([Id_część_ciała])
GO
ALTER TABLE [dbo].[Zabiegi_zlecone] CHECK CONSTRAINT [id_część_ciała_zz]
GO
ALTER TABLE [dbo].[Zabiegi_zlecone]  WITH CHECK ADD  CONSTRAINT [id_skier_wew_zz] FOREIGN KEY([Id_skier_wew])
REFERENCES [dbo].[Skierowania_wew] ([Id_skier_wew])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zabiegi_zlecone] CHECK CONSTRAINT [id_skier_wew_zz]
GO
ALTER TABLE [dbo].[Zabiegi_zlecone]  WITH CHECK ADD  CONSTRAINT [id_Strony_ciała_zz] FOREIGN KEY([Id_strony_ciała])
REFERENCES [dbo].[Strony_ciała] ([id_strony_ciała])
GO
ALTER TABLE [dbo].[Zabiegi_zlecone] CHECK CONSTRAINT [id_Strony_ciała_zz]
GO
ALTER TABLE [dbo].[Zabiegi_zlecone]  WITH CHECK ADD  CONSTRAINT [Id_urazu_zz] FOREIGN KEY([Id_urazu])
REFERENCES [dbo].[Urazy] ([Id_urazu])
GO
ALTER TABLE [dbo].[Zabiegi_zlecone] CHECK CONSTRAINT [Id_urazu_zz]
GO
ALTER TABLE [dbo].[Zabiegi_zlecone]  WITH CHECK ADD  CONSTRAINT [Id_zabiegu_zz] FOREIGN KEY([Id_zabiegu])
REFERENCES [dbo].[Zabiegi] ([Id_zabiegu])
GO
ALTER TABLE [dbo].[Zabiegi_zlecone] CHECK CONSTRAINT [Id_zabiegu_zz]
GO
/****** Object:  StoredProcedure [dbo].[dodaj_pacjenta]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Za sprawą procedury dodajemy nowego pacjenta. 
Podczas wpisywania pacjenta sprawdzana jest poprawność numeru pesel. 
W przypadku błędu, procedura zostanie wycofana. 
*/
CREATE   proc [dbo].[dodaj_pacjenta]
(
	@Imię as varchar(15),
	@Nazwisko as varchar(30),
	@Pesel as char(11),
	@Telefon as varchar(11) = 'brak',
	@Email as varchar(20) ='brak'
)
as
begin try
begin tran 
declare @cyfra as int 
declare @liczba_stała as int = 10
declare @kontrolna as int = right(@pesel,1)
----Sprawdzenie poprawności numeru pesel. 
----Gdy jest poprawny pacjent zostanie dodany do bazy
	if exists(
			   select pesel 
				 from dbo.Pacjenci 
			    where pesel = @pesel
			  )
			begin
				select ('pacjent już istnieje') as komunikat
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
					@kontrolna - right(@liczba_stała - @cyfra,1) = 0
				  begin
						insert into dbo.pacjenci (imię,nazwisko,pesel,Telefon,email)
							 values(@imię,@nazwisko,@pesel,@Telefon,@Email)
							 select('pacjent dodany') as komunikat
							 select * 
							   from dbo.Pacjenci 
							  where pesel = @pesel
				  end 
			  else
				  begin
					select 'błędny pesel' as komunikat
				  end
			end
commit
end try
begin catch
begin
rollback
		Select 'Błąd. Pacjent nie został dodany' as komunikat
	   declare @id as int
           set @id = (
						select max(Id_pacjenta) 
		                  from dbo.Pacjenci
					  )
dbcc checkident('Pacjenci',reseed,@id)
end
end catch




GO
/****** Object:  StoredProcedure [dbo].[dodaj_pracownika]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Za sprawą procedury dodajemy nowego pracownika 
*/
CREATE   proc [dbo].[dodaj_pracownika]
@Imię_pracownika as varchar(20),
@Nazwisko_pracownika as varchar(30),
@Nazwa_profesji as varchar(14)
WITH EXECUTE AS OWNER
as
begin try
begin tran 
begin
declare @id_profesji as smallint 
	set @id_profesji = 
					  (
						Select id_profesji 
						  from dbo.Profesje 
						 where Nazwa_profesji = @Nazwa_profesji
					   )
	insert into Pracownicy
	     values (@Imię_pracownika,@Nazwisko_pracownika,@id_profesji)
		 Select 'Jeśli dodałeś lekarza. Uzupełnij jego specjalizację' as komunikat
commit
end
end try
begin catch
rollback
print 'błąd - spróbuj ponownie'
declare @id as int set @id =
							(
								select MAX(id_pracownika) 
								  from dbo.Pracownicy
							)
dbcc checkident ('dbo.Pracownicy',reseed,@Id)
;throw
end catch


GO
/****** Object:  StoredProcedure [dbo].[dodaj_zabiegi]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Za sprawą tej procedury, użytkownik(lekarz) dodaje zabiegi dla pacjenta. 
	Pacjent może podać termin od kiedy potencjalnie może udać sie do fizjoterpauety.
	W przypadku braku daty procedura wyznaczy najbliższy wolny termin u fizjoterapeuty. 
*/
CREATE   proc [dbo].[dodaj_zabiegi] 
(
@id_pacjenta as int,
@id_pracownika as int,
@zabieg1 as varchar(100),
@zabieg2 as varchar(100) = null,
@zabieg3 as varchar(100) = null,
@zabieg4 as varchar(100) = null,
@zabieg5 as varchar(100) = null,
@data as date = null
)
with execute as owner
as
begin try
begin tran 
		declare @id_profesji as smallint
			set @id_profesji = (
								 select id_profesji 
								   from dbo.pracownicy
								  where Id_pracownika = @id_pracownika
								 )
		set @data = ISNULL(@data, getdate())
		declare @dzień as date 
		set @dzień = getdate()
/* 
	poniższy fragment ma zazadanie pilnować aby użytkownik nie dodał nowych 
	nowych zabiegów w przypadku gdy pacjent jeszcze kontynuje poprzednie zabiegi
	oraz ewentualnej pomyłki przy loginie pacjenta, aby nie dodał błędnych zabiegów
	dla innego pacjenta. W przypadku błędu całość zostanie wycofana.
*/
		declare @id_koniec_zabiegów as int
			set @id_koniec_zabiegów 
									= (
										select max(id_dzień)+10 
										  from dbo.Numery_zleceń   as nz 
								    inner join dbo.Skierowania_wew as sw
											on sw.Id_skier_wew = nz.Id_skier_wew
										 where id_pacjenta     = @id_pacjenta
									   )
		declare @id_dzień as int 
			set @id_dzień = 
							(
							  Select id_dzień 
							    from dbo.Kalendarz 
							   where dzień = @data
							 )
		declare @id_dzień_następnej_wizyty as int
			set @id_dzień_następnej_wizyty = 
											(
											  select id_dzień 
											    from dbo.Grafik_lek_fizjo
											   where id_pracy = 
															   (
																select id_pracy 
																  from dbo.Wizyty 
																 where Id_wizyty = 
																				  (
																					select max(id_wizyty) 
																					  from dbo.Wizyty
																					 where id_pacjenta = @id_pacjenta))
												 and id_pracownika <> @id_pracownika
																)
		if @id_dzień_następnej_wizyty > @id_dzień
			begin
				 select 'zabiegi jeszcze nie zostały zlecone'
			end 
		else 
			if @id_koniec_zabiegów > @id_dzień
		       begin
					select 'zabiegi jeszcze trwają'
			   end
			else
/*
	Podczas wypisywania zabiegów automatycznie tworzone jest skierowanie. 
*/
				begin
					declare @nr_skier_wew as varchar(20)
						set @nr_skier_wew = 
											(
											 Select Concat(@id_pacjenta,@id_pracownika,@dzień)
											)	
				insert into Skierowania_wew (Nr_skier_wew,id_pacjenta,id_pracownika)
					 values (@nr_skier_wew, @id_pacjenta,@id_pracownika)
/*
	Elementy kodu przechodzą do kolejnej procedury której przeznaczeniem jest
	ustalić jaki zabieg powinien być wykonany dla Pacjenta
*/
				exec uzupełnij_zabiegi
				@id_pacjenta = @id_pacjenta,
				@zabieg1 = @zabieg1,
				@zabieg2 = @zabieg2,
				@zabieg3 = @zabieg3,
				@zabieg4 = @zabieg4,
				@zabieg5 = @zabieg5
/* 
Odnalezienie pracownika-fizjoterpaeuty który dysponuje najbliższym wolnym terminem
W przypadku gdy skierowanie wystawia fizjoterapeuta poniższy blok ominie ponowną wizytę 
u specjalisty przed rozpoczęciem zabiegów. 
*/
			if @id_profesji = 2 
				begin
						Select 'Dane dodane ale wystawia fizjoterapeuta nie dodajemy kolejnej wizyty' as komunikat
				end
			else 
				begin
				declare @id_pracownika2 as smallint
					set @id_pracownika2 = 
										(
											select top 1 g.Id_pracownika 
											  from dbo.Pracownicy       as p
										inner join dbo.Grafik_Lek_fizjo as g
											    on p.Id_pracownika = g.Id_pracownika
											 where Id_profesji  = 2
											   and id_dzień > (select id_dzień 
																 from dbo.Kalendarz 
																where dzień = @data)
											   and id_status = 1
										  order by id_dzień
										)
/*
Ustalenie wolnego i zapisanie pacjenta w pierwszym wolnym terminie, bądź w terminie, który wyznaczy Pacjent
*/
				exec ustalenie_terminu_wizyty
				@id_pracownika = @id_pracownika2,
				@id_pacjenta = @Id_pacjenta,
				@data = @data	
			end
			end
commit
end try 
begin catch
rollback
print'wycofano Skierowania_wew'
declare @id as int Set @id = (select MAX(id_skier_wew) 
								from Skierowania_wew)
dbcc checkident ('Skierowania_wew', reseed, @id)
;throw
end catch 


GO
/****** Object:  StoredProcedure [dbo].[dodaj_zlecenie]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		/*
			Za pomocą tej procedury, użytkownik - fizjoterapeuta. Wyznacza term wykonania zabiegów.
		*/
CREATE   proc [dbo].[dodaj_zlecenie]
(
	@id_pacjenta as int,
	@id_pracownika as int,
	@nazwa_grupy as varchar(10),
	@data as date = null
)
WITH EXECUTE AS OWNER
as
begin try
begin tran
begin 
set @data = ISNULL(@data, getdate())
declare @id_grupy as int
		select @id_grupy = id_grupy 
		  from dbo.grupy_zabiegów
		 where nazwa = @nazwa_grupy 
-------------------------------------------------
declare @id_skier_wew as int
		select  @id_skier_wew = max(id_skier_wew) 
		  from dbo.Skierowania_wew
		 where id_pacjenta = @id_pacjenta
-------------------------------------------------
declare @zliczenie as int
		select @zliczenie = count(id_skier_wew) 
		  from dbo.Zabiegi_zlecone
		 where Id_skier_wew = @id_skier_wew
	  group by id_skier_wew
-------------------------------------------------
declare @id_koniec_zabiegów as int
    set @id_koniec_zabiegów 
							= (select max(id_dzień)+10 
							     from dbo.Numery_zleceń as nz 
						   inner join Skierowania_wew   as sw
								   on sw.Id_skier_wew = nz.Id_skier_wew
								where id_pacjenta  = @id_pacjenta)
-------------------------------------------------
/* 
	Fragment sprawdza czy poprzednie zabiegi się zakończyły. Nie można dodać
	nowych gdy poprzednie jeszcze trwają. 
*/
declare @id_dzień as int 
		set @id_dzień = (
							Select id_dzień 
							from dbo.kalendarz 
							where dzień = @data
						)
	if @id_koniec_zabiegów > @id_dzień
		begin
			select 'zabiegi jeszcze trwają' as komunikat
		end
	else
		begin
/*
	Fragment kodu ma zazadanie sprawdzić kiedy jest najblizszy potencjalny termin
	wszystkich zabiegów. Musi brać pod uwagę, że wszystkie zabiegi powinny 
	być wykonane w tym samym czasie. Niedopuszczalna jest sytuacja że część będzie można
	wykonać teraz a część dopiero za miesiąc. 
*/
declare @z as int
declare @i as int
Declare @y as int 
				select @z = max(d.id_dzień)
					 , @y = min(d.id_dzień) 
				  from
					  (
						select top 2 c.id_dzień 
						  from 
								(
									select kz.id_dzień
									     , kz.id_zabiegu
										 , kz.id_grupy
										 , count(a.id_zabiegu) as ilość_wykorzystanych
									  from dbo.kalendarz_zabiegowy as kz
								inner join Zabiegi as z
										on kz.id_zabiegu = z.Id_zabiegu
								 left join 
										  (
											select zz.id_zabiegu
											     , b.Id_grupy
												 , b.Id_dzień from 
																  (
																	select * 
																	  from dbo.Numery_zleceń
																	 union
																	select l.* 
																	  from dbo.Numery_zleceń
															   cross apply kolejny_tydzień(numer_zlecenia) as l
															        ) as b
													      inner join Zabiegi_zlecone as zz 
			                                                      on zz.Id_skier_wew = b.Id_skier_wew
										  ) as a
											on a.id_zabiegu = kz.id_zabiegu
										   and kz.id_grupy  = a.id_grupy
										   and kz.id_dzień  = a.id_dzień
									where kz.id_dzień > (
														 select id_dzień 
									                       from dbo.Kalendarz 
														  where dzień = @data
														 )
									  and kz.id_zabiegu in (
															 select id_zabiegu 
									                           from dbo.Zabiegi_zlecone
															  where id_skier_wew = @id_skier_wew
															)
									  and kz.id_grupy = @id_grupy
							group by kz.id_k_z,kz.id_dzień,kz.id_zabiegu,kz.id_grupy
							  having count(a.id_zabiegu) < (
															select z1.max_ilość_grupa 
															  from dbo.Zabiegi as z1 
															 where z1.Id_zabiegu = kz.id_zabiegu
															)
						) as c
						group by c.id_dzień
						having count(c.id_dzień) = @zliczenie
						) as  d
if @z - @y = 5 
set @i = @y
else 
set @i= @z
		insert into Numery_zleceń (Id_skier_wew,id_pracownika,id_dzień,id_grupy)
		values (@id_skier_wew,@id_pracownika,@i,@id_grupy)
/*
	Poniższy fragment wyznacza wizyty kontrolne u fizjoterapeuty, a następnie
	u lekarza w celu ewentulanych wizyt kontrolnych. Kod pilnuje aby odbyły się 
	one po zakończonych zabiegach i w pierwszym wolnym terminie. 
*/
-------------------------------------------------
declare @dzień as date
set @dzień = (
				select dzień 
				  from dbo.Kalendarz
				 where id_dzień =  @i+10 
			 )
----Ustalenie terminu do fizjoterapeuty
exec ustalenie_terminu_wizyty
@id_pracownika = @id_pracownika,
@id_pacjenta = @id_pacjenta,
@data = @dzień
-----Ustalenie terminu wizyty u lekarza. 
declare @id_pracownika2 as int
declare @id_profesji as int
	set @id_profesji = (
						select id_profesji 
						  from dbo.Pracownicy
						 where Id_pracownika = @id_pracownika
						 )
if @id_profesji = 2  
	   set @id_pracownika2 = (
				select p.id_pracownika 
				  from pracownicy as p
			inner join specjalizacje as s
					on s.id_pracownika = p.id_pracownika
				  where s.id_część_ciała = (
											select id_część_ciała 
											  from zabiegi_zlecone
											 where id_zabiegu_zleconego = (
																			select max(id_zabiegu_zleconego) 
																			  from zabiegi_zlecone
																			 where id_skier_wew = @id_skier_wew)
																		   ))
	    
	  else
		set  @id_pracownika2  = 
								 (
									select id_pracownika 
									  from dbo.Skierowania_wew
									 where Id_skier_wew = @id_skier_wew 
							     ) 
---------------------------------------------------
declare @dzień2 as date
		set @dzień2 = (
						select top 1 dzień 
						from dbo.Kalendarz
						where dzień >  @dzień 
					  )
-------------------------------------------------
exec ustalenie_terminu_wizyty
@id_pracownika = @id_pracownika2,
@id_pacjenta = @id_pacjenta,
@data = @dzień2
-------------------------------------------------
end
end
commit
end try 
begin catch
rollback
print'wycofano całość'
declare @id as int set @id = (select MAX(id_skier_wew) 
								from Skierowania_wew)
dbcc checkident ('Skierowania_wew', reseed, @id)
;throw
end catch 
GO
/****** Object:  StoredProcedure [dbo].[karta_zabiegowa]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
			/*
				Procedura ma za zadanie pokazać kartę zabiegową pacjenta. 
			*/
CREATE   proc [dbo].[karta_zabiegowa]
@Numer_zlecenia as int
as
begin
-------------------------------------------------
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
			 , k.dzień
			 , a.godziny
		 from obliczenia as t
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
			from dbo.numery_zleceń nz
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
		   where nz.numer_zlecenia  = @numer_zlecenia) as a
inner join dbo.Kalendarz as k
	    on k.id_dzień = a.id_dzień+liczba
  order by k.dzień;
-------------------------------------------------
end
GO
/****** Object:  StoredProcedure [dbo].[kasuj_zabiegi]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Procedura ma za zadanie skasować zabieg,który został przypisany pacjentowi w wyniku pomyłki
	Nie można już w ten sposób skasować zabiegu, gdy pacjent rozpocznie cykl.
*/

CREATE     proc [dbo].[kasuj_zabiegi]
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
GO
/****** Object:  StoredProcedure [dbo].[pacjenci_dziś]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Procedura pokazuje pacjentów którzy mają wizyt w danym dniu
*/
CREATE proc [dbo].[pacjenci_dziś]
(
	@dzień as date = null,
	@id_pracownika as int
)
as
begin
	set @dzień = isnull(@dzień,GETDATE())
	select  id_pacjenta
		  , imię
		  , nazwisko 
	   from dbo.Pacjenci
	  where id_pacjenta in (
	                         select id_pacjenta 
							   from dbo.Wizyty 
	                          where id_pracy = 
							                   (
												 select id_pracy 
												   from dbo.Grafik_Lek_fizjo
												  where id_dzień = 
																  (
																    select id_dzień 
					                                                  from dbo.Kalendarz 
																	 where dzień = @dzień
																  )
	    and id_pracownika = @id_pracownika
						 )					  )
end
GO
/****** Object:  StoredProcedure [dbo].[pokaz_pacjenta]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Procedura pokazuje dane o pacjencie
*/
CREATE   proc [dbo].[pokaz_pacjenta]
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
GO
/****** Object:  StoredProcedure [dbo].[rezygnacja_z_wizyty]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
	Za sprawą procedury kasujemy wizyty pacjenta. 
*/
CREATE   procedure [dbo].[rezygnacja_z_wizyty]
@id_pacjenta as int,
@data as date = Null
as
begin try
begin tran 
begin
---- aktualizacja grafiku. Lekarz/Fizjterpauta może przyjąć max 10 pacjentów
---- skoro osoba rezygnuje status zostaje zmieniony. 
set @data = ISNULL(@data, getdate())
	update Grafik_Lek_fizjo
	set id_status  = 1
	where id_pracy in 
						(
							select w.id_pracy 
							  from dbo.Wizyty           as w
						inner join dbo.Grafik_Lek_fizjo as g
							    on g.Id_pracy = w.Id_pracy
						inner join dbo.Kalendarz        as k
							    on k.id_dzień = g.Id_dzień
						inner join dbo.Pracownicy       as pp
							    on pp.id_pracownika = g.id_pracownika
							 where w.id_pacjenta = @id_pacjenta
							   and k.dzień       > @data
						)
	  and Id_status = 0
----Usunięcie wizyty zaplanowanej dla pacjenta
delete from wizyty 
where id_pracy in (     select w.id_pracy 
						  from dbo.Wizyty as w
					inner join dbo.Grafik_Lek_fizjo as g
						    on g.Id_pracy = w.Id_pracy
					inner join dbo.Kalendarz        as k
						    on k.id_dzień = g.Id_dzień
					inner join dbo.Pracownicy       as pp
						    on pp.id_pracownika = g.id_pracownika
						where w.id_pacjenta = @id_pacjenta
						  and k.dzień       > @data
						)
and Id_pacjenta = @id_pacjenta
-------------------------------------------------
end
commit
end try
begin catch
rollback
print 'błąd popraw'
;throw
end catch 
GO
/****** Object:  StoredProcedure [dbo].[rezygnacja_z_zabiegów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	/*
		Za sprawą procedury kasujemy zabiegi, 
		jeśli pacjent z nich zrezygnował.
		Zastosowano cascadowe usuwanie klucza obcego.
	*/
CREATE   proc [dbo].[rezygnacja_z_zabiegów] 
@id_pacjenta as int,
@data as date = null
as
begin try
begin tran 
begin
set @data = ISNULL(@data, getdate())
declare @id_skier_wew as int 
	set @id_skier_wew = 
					   (
						Select max(id_skier_wew) 
					      from Skierowania_wew 
						 where id_pacjenta = @id_pacjenta
					   )
----Usunięcie skierowania wewnętrznego
delete from Skierowania_wew
	  where id_skier_wew = @id_skier_wew
-------------------------------------------------
/*
	W przypadku rezygnacji z zabiegów. 
	Usuwane są również wizyty kontrolne.
*/
-------------------------------------------------
exec rezygnacja_z_wizyty
@id_pacjenta = @id_pacjenta,
@data = @data
end
-------------------------------------------------
commit
end try
begin catch
rollback
Select 'Zabieg nie został usunięty' as komunikat
;throw
end catch 
GO
/****** Object:  StoredProcedure [dbo].[ustalenie_grafiku_rehabilitantów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Za sprawą tej procedury jesteśmy wstanie stworzyć grafik rehabilitantów na dany miesiąc.
	Każdemy pracownikowi zostanie przypisany zabieg, który będzie odpowiedzialny,
	bez możlwiości zdublowania jego obowiązku w ciągu miesiąca.
*/
CREATE   proc [dbo].[ustalenie_grafiku_rehabilitantów]
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
GO
/****** Object:  StoredProcedure [dbo].[ustalenie_terminu_wizyty]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Procedura ustala termin wizyty do specjalisty
*/
CREATE     proc [dbo].[ustalenie_terminu_wizyty]
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
		set @id = (select MAX(id_wizyty) from Wizyty)
		dbcc checkident('wizyty',reseed,@id)
		;throw
end catch 
GO
/****** Object:  StoredProcedure [dbo].[uzupełnij_zabiegi]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[uzupełnij_zabiegi]
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
---- deklaracja zmiennych
		declare @zabiegi as zabiegi
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
---- sprawdzenie czy pacjent nie jest w trkacie zabiegów
		if @id_dzień > (
						 Select id_dzień 
						   from dbo.Numery_zleceń 
						  where Id_skier_wew = @id_skier_wew
						)
			begin
				Select 'Zabiegi juz trwają. Nie można skasować ani dodać nowego zabiegu'
			end
		else
			begin
				insert into @zabiegi (zabieg)
				values(@zabieg1),(@zabieg2),(@zabieg3),(@zabieg4),(@zabieg5)
;with obliczenia as
		(
		select id
			 , max(case when lp = 1 then wartość end) as Nazwa_części_ciała
			 , max(case when lp = 2 then wartość end) as Zabieg
			 , max(case when lp = 3 then wartość end) as Strona_ciała
			 , max(case when lp = 4 then wartość end) as kod_urazu
			 , max(case when lp = 5 then wartość end) as Uwagi
		  from
				 (
						select id
							 , value as wartość
							 , row_number () over (partition by id order by id) as lp
						  from @zabiegi
				   cross apply string_split(Zabieg,',')
				  ) as tabela
		  group by id
		 ) 
	   insert into zabiegi_zlecone (Id_skier_wew,Id_część_ciała,Id_zabiegu,Id_strony_ciała,Id_urazu,Uwagi)
		    select @id_skier_wew
				 , cc.Id_część_ciała
			     , snz.id_skrótu_nazwy_zabiegu as id_zabiegu
				 , sc.id_strony_ciała
				 , u.id_urazu,Uwagi 
			  from obliczenia               as o
		inner join dbo.Części_ciała         as cc
		        on cc.Nazwa_części_ciała = o.Nazwa_części_ciała
		inner join dbo.Skróty_nazw_zabiegów as snz
		        on o.Zabieg = snz.Skrót
		inner join dbo.Strony_ciała         as sc
		        on o.Strona_ciała        = sc.Strona_ciała
		inner join dbo.urazy                as u
		        on u.Kod_urazu           = o.kod_urazu
end
-------------------------------------------------
commit
end try 
begin catch
rollback
print'Uzupełnij zabiegi'
declare @id as int set @id = (select MAX(id_zabiegu_zleconego) 
								from Zabiegi_zlecone)
dbcc checkident ('Zabiegi_zlecone', reseed, @id)
;throw
end catch 
GO
/****** Object:  StoredProcedure [dbo].[zapis_do_lekarza]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
			/*
			Za sprawą procedury dokonujemy zapisu do lekarza
			*/
CREATE   proc [dbo].[zapis_do_lekarza]
(
	@Nr_skier_zew as int, 
	@Data_wystawienia as date, 
	@Id_pacjenta as int,
	@Nazwa_części_ciała as varchar(25),
	@Uwagi as varchar(50) = 'brak',
	@data as date = null
)
WITH EXECUTE AS OWNER
as
set nocount on;
begin tran
begin try
set @data = ISNULL(@data,getdate())
      if @Data_wystawienia > GETDATE()
		 begin 
			select 'Data wystawienia nie może być późniejsza niż dzień dzisiejszy'
		 end 
	  else
		  if @Data_wystawienia < (dateadd(d,-31,GETDATE()))
	        begin
		         select 'Skierowanie przeterminowane'
	          end
          else 
	          begin
					declare @Id_część_ciała as int
					set @Id_część_ciała = 
										  (
										   Select Id_część_ciała 
											 from dbo.Części_ciała
											where Nazwa_części_ciała = @Nazwa_części_ciała
										  )
					insert into Skierowania_zew (Nr_skier_zew, Data_wystawienia,Id_pacjenta,Id_część_ciała,Uwagi)
					values(@Nr_skier_zew, @Data_wystawienia, @Id_pacjenta, @Id_część_ciała,@Uwagi)
								/* 
								dopasowanie lekarza, którego specjalizacja jet uraz pacjenta
								*/
		
					declare @id_pracownika as int
					set @id_pracownika = 
											(
											   select id_pracownika 
												 from dbo.Specjalizacje 
												where id_część_ciała = @Id_część_ciała
											)
									/*
							Ustalenie pierwszego wolnego terminu, bądź terminu po dacie wskazanej przez pacjenta
							*/
					exec ustalenie_terminu_wizyty
					@id_pracownika = @id_pracownika,
					@id_pacjenta = @Id_pacjenta,
					@data = @data
end		
commit
end try
begin catch
		rollback
			declare @id as int
			set @id = (
						Select MAX(id_skier_zew) 
			              from Skierowania_zew
					  )
			print 'skierowanie nie zostało wpisane'
			dbcc checkident ('Skierowania_zew',reseed,@id)
end catch 





GO
/****** Object:  StoredProcedure [dbo].[zmień_termin_zabiegów]    Script Date: 01.07.2022 14:34:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Za sprawą procedury zmieniamy termin zabiegów na podany przez pacjenta termin
*/
CREATE   proc [dbo].[zmień_termin_zabiegów]
@id_pacjenta as int,
@id_pracownika as int,
@nazwa_grupy as varchar(10),
@nowy_termin as date
as
begin try
begin tran 
/*
	Sprawdzenie czy zabiegi już trwają.
	Termin nie moze być zmieniony jeśli zabiegi się już rozpoczeły.	
*/
declare @id_dzień as int
			set @id_dzień =  (
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
		if @id_dzień > (
						Select id_dzień 
		                  from dbo.Numery_zleceń 
						 where Id_skier_wew = @id_skier_wew
						)
			begin
					Select 'Zabiegi juz trwają. Nie można przesunąć terminu' as Komunikat
			end
		else
			begin
				Declare @nr_zlecenia as int 
					set @nr_zlecenia = 
					                   (
									     select numer_zlecenia 
									       from dbo.Numery_zleceń 
										  where Id_skier_wew = @id_skier_wew
										)
				Declare @id_pracownika_wystawiającego as int 
					set @id_pracownika_wystawiającego = 
														(
														  select id_pracownika 
														    from dbo.Numery_zleceń 
														   where Id_skier_wew = @id_skier_wew
														)						
/* 					
	Usunięcie zlecenia, które dotyczyło zabiegów
*/
	delete from dbo.Numery_zleceń
		  where Id_skier_wew = @id_skier_wew

/*
	Usunięcie zabiegów po zakończonych zabiegach

*/

	exec rezygnacja_z_wizyty
	@id_pacjenta = @id_pacjenta
/*
	Stworzenie nowego zlecenia, przypisanie nowego terminu 
	oraz wyznaczenie wizyt do lekarza i fizjoterapeuty
*/

	exec dodaj_zlecenie
	@id_pacjenta = @id_pacjenta,
	@id_pracownika = @id_pracownika_wystawiającego,
	@nazwa_grupy = @nazwa_grupy,
	@data = @nowy_termin

				end
commit
end try 
begin catch
print 'błąd - termin nie został zmieniony'
rollback
;throw
end catch 
GO
USE [master]
GO
ALTER DATABASE [leczenie_rehabilitacja] SET  READ_WRITE 
GO
