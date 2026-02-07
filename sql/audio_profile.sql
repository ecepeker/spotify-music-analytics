USE [SpotifyAnalytics]
GO

/****** Object:  View [dbo].[audio_profile]    Script Date: 7.02.2026 21:25:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[audio_profile] AS
SELECT
    CASE
        WHEN tempo < 90 THEN 'Slow'
        WHEN tempo BETWEEN 90 AND 120 THEN 'Medium'
        ELSE 'Fast'
    END AS tempo_category,
    CASE
        WHEN energy < 0.4 THEN 'Low Energy'
        WHEN energy BETWEEN 0.4 AND 0.7 THEN 'Medium Energy'
        ELSE 'High Energy'
    END AS energy_category,
    COUNT(*) AS track_count,
    AVG(popularity) AS avg_popularity
FROM dbo.tracks_final
GROUP BY
    CASE
        WHEN tempo < 90 THEN 'Slow'
        WHEN tempo BETWEEN 90 AND 120 THEN 'Medium'
        ELSE 'Fast'
    END,
    CASE
        WHEN energy < 0.4 THEN 'Low Energy'
        WHEN energy BETWEEN 0.4 AND 0.7 THEN 'Medium Energy'
        ELSE 'High Energy'
    END;
GO


