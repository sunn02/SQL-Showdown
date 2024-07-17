USE StackOverflow2010;
GO

-- Contar los comentarios, publicaciones y medallas por usuario en subconsultas
SELECT TOP 200
    U.DisplayName,
    COALESCE(CommentCounts.CommentCount, 0) AS CommentCount,
    COALESCE(PostCounts.PostsCount, 0) AS PostsCount,
    COALESCE(BadgeCounts.BadgesCount, 0) AS BadgesCount
FROM dbo.Users U
LEFT JOIN (
    SELECT UserId, COUNT(*) AS CommentCount
    FROM dbo.Comments
    GROUP BY UserId
) AS CommentCounts ON U.Id = CommentCounts.UserId
LEFT JOIN (
    SELECT OwnerUserId, COUNT(*) AS PostsCount
    FROM dbo.Posts
    GROUP BY OwnerUserId
) AS PostCounts ON U.Id = PostCounts.OwnerUserId
LEFT JOIN (
    SELECT UserId, COUNT(*) AS BadgesCount
    FROM dbo.Badges
    GROUP BY UserId
) AS BadgeCounts ON U.Id = BadgeCounts.UserId
ORDER BY U.DisplayName;

