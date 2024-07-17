USE StackOverflow2010;
GO
SELECT TOP 200 DisplayName, Location, Reputation
FROM dbo.Users
ORDER BY Reputation DESC;
