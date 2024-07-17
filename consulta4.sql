USE StackOverflow2010;
GO
SELECT TOP 200 U.DisplayName, C.CommentCount 
FROM (
	SELECT UserId, COUNT(Comments.Id) AS CommentCount
	FROM dbo.Comments
	GROUP BY UserId
) AS C
JOIN dbo.Users U
ON UserId = U.Id
WHERE C.CommentCount > 100;




