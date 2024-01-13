USE [ProcAppDelivery]
GO
/****** Object:  Table [dbo].[APPADMONCAT003]    Script Date: 13/01/2024 12:11:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPADMONCAT003](
	[APPADMONCAT003_IdPais] [int] IDENTITY(1,1) NOT NULL,
	[APPADMONCAT003_Pais] [varchar](20) NOT NULL,
	[APPADMONCAT003_Abreviacion] [varchar](20) NOT NULL,
	[APPADMONCAT003_FechaInsert] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
