USE StackOverflow2010;
GO
SELECT TOP 200 P.Title, U.DisplayName
FROM dbo.Posts P
JOIN dbo.Users U
ON P.OwnerUserId = U.Id;
