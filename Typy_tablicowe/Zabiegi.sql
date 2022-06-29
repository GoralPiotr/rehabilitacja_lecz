USE [leczenie_rehabilitacja]
GO
  
/****** Object:  UserDefinedTableType [dbo].[zabiegi]    Script Date: 29.06.2022 22:19:27 ******/
CREATE TYPE [dbo].[zabiegi] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Zabieg] [varchar](100) NULL
)
GO


