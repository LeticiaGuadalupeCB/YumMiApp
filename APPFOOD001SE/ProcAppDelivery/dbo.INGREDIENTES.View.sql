USE [ProcAppDelivery]
GO
/****** Object:  View [dbo].[INGREDIENTES]    Script Date: 04/04/2024 03:21:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[INGREDIENTES]  AS 

WITH Ingredientes as 
		(SELECT
			A.APPFPRODCAT004_IdIngrediente as IdIngrediente,
			A.APPFPRODCAT004_Ingrediente as Ingrediente,
			A.APPFPRODCAT004_Descripcion as Descripcion
		FROM APPFPRODCAT004 A
		LEFT JOIN APPFPRODCAT008 B ON A.APPFPRODCAT004_IdIngrediente = B.APPFPRODCAT004_IdIngrediente
		WHERE A.APPFPRODCAT004_IdIngrediente NOT IN (
			SELECT x.APPFPRODCAT004_IdIngrediente FROM APPFPRODCAT008 X WHERE X.APPFPRODCAT002_IdTipoAlimentacion = X.APPFPRODCAT002_IdTipoAlimentacion
		) OR B.APPFPRODCAT002_IdTipoAlimentacion IS NULL
		GROUP BY
			A.APPFPRODCAT004_IdIngrediente,
			A.APPFPRODCAT004_Ingrediente,
			A.APPFPRODCAT004_Descripcion
			), Imagenes as 
			(
				SELECT APPFPRODCAT004_IdIngrediente, APPFPRODCAT004_Foto
				FROM APPFPRODCAT004
			)

			SELECT *, APPFPRODCAT004_Foto as Foto FROM Ingredientes A
			JOIN Imagenes B ON A.IdIngrediente = b.APPFPRODCAT004_IdIngrediente
GO
