USE [SpotifyAnalytics]
GO

/****** Object:  View [dbo].[popularity_buckets]    Script Date: 7.02.2026 21:26:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[popularity_buckets] AS
SELECT
    CASE
        WHEN popularity >= 80 THEN 'Very High'
        WHEN popularity BETWEEN 60 AND 79 THEN 'High'
        WHEN popularity BETWEEN 40 AND 59 THEN 'Medium'
        WHEN popularity BETWEEN 20 AND 39 THEN 'Low'
        ELSE 'Very Low'
    END AS popularity_bucket,
    COUNT(*) AS track_count,
    AVG(energy) AS avg_energy,
    AVG(danceability) AS avg_danceability,
    AVG(valence) AS avg_valence
FROM dbo.tracks_final
GROUP BY
    CASE
        WHEN popularity >= 80 THEN 'Very High'
        WHEN popularity BETWEEN 60 AND 79 THEN 'High'
        WHEN popularity BETWEEN 40 AND 59 THEN 'Medium'
        WHEN popularity BETWEEN 20 AND 39 THEN 'Low'
        ELSE 'Very Low'
    END;
GO


