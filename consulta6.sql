USE StackOverflow2010;
GO

BEGIN TRANSACTION;
DELETE C
FROM dbo.Comments C
JOIN dbo.Users U 
ON C.UserId = U.Id
WHERE U.Reputation < 100;

-- Almacenar la cantidad de filas eliminadas
DECLARE @DeletedRows INT;
SET @DeletedRows = @@ROWCOUNT;

IF @DeletedRows > 0
BEGIN
    PRINT CAST(@DeletedRows AS NVARCHAR(10)) + ' comentarios fueron eliminados correctamente.'; --CAST: Es una función en SQL Server que se utiliza para convertir un valor de un tipo de datos a otro tipo de datos.
	--AS NVARCHAR(10): Especifica que el valor de @DeletedRows se debe convertir al tipo de datos NVARCHAR con una longitud máxima de 10 caracteres.
END

SELECT TOP 200
    U.DisplayName, 
    U.Reputation, 
    COUNT(C.Id) AS CommentCount
FROM dbo.Users U
LEFT JOIN dbo.Comments C -- Muestra todos los usuarios, independientemente de si tienen comentarios o no. 
ON U.Id = C.UserId
GROUP BY U.DisplayName, U.Reputation

COMMIT TRANSACTION;