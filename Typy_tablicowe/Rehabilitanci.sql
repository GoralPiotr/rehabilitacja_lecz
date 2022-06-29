USE [leczenie_rehabilitacja]
GO
 
/****** Object:  UserDefinedTableType [dbo].[rehabilitanci]    Script Date: 29.06.2022 22:18:53 ******/
CREATE TYPE [dbo].[rehabilitanci] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pracownika] [int] NULL
)
GO


