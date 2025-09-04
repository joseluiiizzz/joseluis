-- Crear tabla de usuarios
CREATE TABLE Users (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100)
);

-- Insertar un usuario
INSERT INTO Users(nombre) VALUES ('Fabio');

-- Actualizar un usuario (por ejemplo id=1)
UPDATE Users SET nombre = 'Fabio Senatino' WHERE id = 1;

-- Crear tabla de logs
CREATE TABLE UserLogs (
    userLogId INT PRIMARY KEY IDENTITY(1,1),
    [action] VARCHAR(100),
    [user] VARCHAR(100),
    [date] DATETIME,
	[message] VARCHAR(500)
);
SELECT * FROM UserLogs;
SELECT * FROM Users;

-- Trigger para DELETE en Users
CREATE TRIGGER trigger_delete_user ON Users
AFTER DELETE
AS
BEGIN
    INSERT INTO UserLogs ([action], [user], [date])
    VALUES ('DELETE', SUSER_NAME(), SYSDATETIME());
END;
GO

-- Trigger para UPDATE en Users
CREATE TRIGGER trigger_update_user ON Users
AFTER UPDATE
AS
BEGIN
    INSERT INTO UserLogs ([action], [user], [date])
    VALUES ('UPDATE', SUSER_NAME(), SYSDATETIME());
END;
GO

-- Probar DELETE (borrar usuario id=1)
DELETE FROM Users WHERE id = 1;

-- Consultar logs con descripción
SELECT
    userLogId,
    [action],
    [user],
    [date],
    CASE
        WHEN [action] = 'DELETE' THEN 'Se eliminó un usuario'
        WHEN [action] = 'UPDATE' THEN 'Se actualizó un usuario'
        ELSE 'Acción desconocida'
    END AS DescripcionAccion
FROM UserLogs;

-- Consultar tabla Users
SELECT * FROM Users;

DECLARE @numero1 INT = 30;
DECLARE @numero2 INT = 20;

DECLARE @suma INT = @numero1 + @numero2;

PRINT 'La suma es:';
PRINT @suma;


/* TABLA COMBINADA */ 

CREATE TRIGGER trigger_update_delete_user ON Users
AFTER UPDATE, DELETE
AS
BEGIN
    DECLARE @accion VARCHAR(10) = 'DESCONOCIDA'; 

    IF EXISTS (SELECT * FROM deleted) AND EXISTS (SELECT * FROM inserted)
        SET @accion = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
        SET @accion = 'DELETE';

    IF @accion IN ('UPDATE', 'DELETE')
    BEGIN
        INSERT INTO UserLogs ([action], [user], [date])
        VALUES (@accion, SUSER_NAME(), SYSDATETIME());
    END
END;

UPDATE Users SET [users] = 'Luis' WHERE id =1;

--PARA EJECUTAR LA TABLA 
SELECT
    userLogId,
    [action],
    [user],
    [date],
    CASE
        WHEN [action] = 'DELETE' THEN 'Se eliminó un usuario'
        WHEN [action] = 'UPDATE' THEN 'Se actualizó un usuario'
        ELSE 'Acción desconocida'
    END AS DescripcionAccion
FROM UserLogs;
