USE [master] 
GO
/****** Object:  Database [leczenie_rehabilitacja]    Script Date: 25.03.2022 13:45:23 ******/
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
/****** Object:  Table [dbo].[Zabiegi_zlecone]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Kalendarz_zabiegowy]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Zabiegi]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Numery_zleceń]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  View [dbo].[liczenie_zabiegów]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Kalendarz]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  View [dbo].[wykorzystanie_zabiegów]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Części_ciała]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Grafik_Lek_fizjo]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Grafik_recepcja]    Script Date: 11.03.2022 12:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grafik_recepcja](
	[id_pracownika] [smallint] NULL,
	[id_dzień] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grafik_rehabilitantów]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Grupy_zabiegów]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Liczby]    Script Date: 11.03.2022 12:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liczby](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacjenci]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Personel_zabiegi]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Profesje]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Skasowane_numery_zleceń]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Skasowane_skierowania]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Skasowane_zabiegi]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Skierowania_wew]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Skierowania_zew]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Skróty_nazw_zabiegów]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Specjalizacje]    Script Date: 11.03.2022 12:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specjalizacje](
	[Id_pracownika] [smallint] NULL,
	[Id_część_ciała] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Strony_ciała]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Urazy]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Table [dbo].[Wizyty]    Script Date: 11.03.2022 12:22:49 ******/
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
/****** Object:  Index [kdzień]    Script Date: 11.03.2022 12:22:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [kdzień] ON [dbo].[Kalendarz]
(
	[dzień] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [skier_zew_id_pac_id_skier]    Script Date: 11.03.2022 12:22:49 ******/
CREATE NONCLUSTERED INDEX [skier_zew_id_pac_id_skier] ON [dbo].[Skierowania_zew]
(
	[Id_pacjenta] ASC,
	[Id_skier_zew] ASC,
	[Id_część_ciała] ASC
)
INCLUDE([Data_wystawienia],[Uwagi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [skier_zew_nr]    Script Date: 11.03.2022 12:22:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [skier_zew_nr] ON [dbo].[Skierowania_zew]
(
	[Nr_skier_zew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Wizyty_id_pracy]    Script Date: 11.03.2022 12:22:49 ******/
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
