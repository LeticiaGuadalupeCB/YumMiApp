USE [ProcAppDelivery]
GO
/****** Object:  StoredProcedure [dbo].[APPADMONCAT003APSPA2]    Script Date: 04/04/2024 03:21:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[APPADMONCAT003APSPA2]
	@Opcion INT,
	@IdTipoNotificacion INT = NULL,
	@Descripcion VARCHAR(50) = NULL,
	@IdTipoUsuario INT = NULL,
	@Icono VARCHAR(MAX) = NULL
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			--GUARDAR
			IF @Opcion = 1
			BEGIN
				INSERT INTO APPADMONCAT007
				(APPADMONCAT007_DescripcionNotificacion,	APPADMONCAT006_IdTipoUsuario, 
				APPADMONCAT007_Icono,						APPADMONCAT007_Activo, 
				APPADMONCAT007_FechaInsert)
				VALUES(
				@Descripcion,								@IdTipoUsuario,
				@Icono,										1,
				GETDATE()
				)

				IF @@ROWCOUNT > 0 
				BEGIN
					SELECT '¡Tipo de Notificación Guardado Correctamente!' as Mensaje, 1 as Correcto, 1 as Icon --Success
				END
				ELSE
				BEGIN
					SELECT 'Ocurrio un error' as Mensaje, 1 as Correcto, 0 as Correcto, 2 as Icon --Danger
				END
			END
			--EDITAR
			IF @Opcion = 2
			BEGIN
				UPDATE APPADMONCAT007
				SET APPADMONCAT007_DescripcionNotificacion = @Descripcion,
					APPADMONCAT006_IdTipoUsuario = @IdTipoNotificacion,
					APPADMONCAT007_Icono = @Icono
				WHERE APPADMONCAT007_IdTipoNotificacion = @IdTipoNotificacion

				SELECT '¡Tipo de Notificación Actualizado Correctamente!' as Mensaje, 1 as Correcto, 1 as Icon --Success
			END

			--ELIMINAR (LOGICO)
			IF @Opcion = 3
			BEGIN
				UPDATE APPADMONCAT007
				SET APPADMONCAT007_Activo = 0,
					APPADMONCAT007_FechaDelete = GETDATE()
				WHERE APPADMONCAT007_IdTipoNotificacion = @IdTipoNotificacion
				SELECT '¡Tipo de Notificación Eliminado Correctamente!' as Mensaje, 1 as Correcto, 1 as Icon --Success
			END
		COMMIT TRAN 
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() + '  No. de Error: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10)) + '  Línea: ' + CAST(ERROR_LINE() AS NVARCHAR(10)) AS Mensaje, 0 AS Correcto, 2 as Icon --Danger
	END CATCH
END

GO
