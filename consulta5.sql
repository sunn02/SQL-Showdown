USE StackOverflow2010;
GO
SELECT TOP 200 DisplayName, Location
FROM dbo.Users;


BEGIN TRANSACTION;
UPDATE dbo.Users
SET Location = 'Desconocido'
WHERE Location = '';

IF @@ROWCOUNT > 0
BEGIN
    PRINT 'La actualización se hizo correctamente.';
END

COMMIT TRANSACTION;


