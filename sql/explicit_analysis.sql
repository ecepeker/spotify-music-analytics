USE [SpotifyAnalytics]
GO

/****** Object:  View [dbo].[explicit_analysis]    Script Date: 7.02.2026 21:26:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[explicit_analysis] AS
SELECT
    explicit,
    COUNT(*) AS track_count,
    AVG(popularity) AS avg_popularity,
    AVG(energy) AS avg_energy,
    AVG(danceability) AS avg_danceability
FROM dbo.tracks_final
GROUP BY explicit;
GO


