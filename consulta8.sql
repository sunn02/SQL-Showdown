USE StackOverflow2010;
GO
SELECT TOP 10 Title, Score
FROM dbo.Posts
ORDER BY Score DESC;
