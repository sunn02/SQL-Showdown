USE StackOverflow2010;
GO
SELECT TOP 200 U.DisplayName,
   	AVG(P.Score) AS AverageScore
FROM dbo.Posts P
JOIN dbo.Users U
ON P.OwnerUserId = U.Id
GROUP BY U.DisplayName;
