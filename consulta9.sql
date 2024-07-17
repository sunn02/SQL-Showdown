USE StackOverflow2010;
GO
SELECT TOP 5 Text, CreationDate
FROM dbo.Comments
ORDER BY CreationDate DESC;