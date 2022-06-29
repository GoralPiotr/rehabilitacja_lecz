USE [leczenie_rehabilitacja]
GO
 
/****** Object:  UserDefinedTableType [dbo].[grafik]    Script Date: 29.06.2022 22:18:08 ******/
CREATE TYPE [dbo].[grafik] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_miejsca_zabiegu] [int] NULL,
	[id_pracownika] [int] NULL,
	[miesi¹c_rok] [varchar](7) NULL
)
GO


