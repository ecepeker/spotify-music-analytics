USE [SpotifyAnalytics]
GO

/****** Object:  View [dbo].[yearly_music_trends]    Script Date: 7.02.2026 21:26:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[yearly_music_trends] AS
SELECT
    YEAR(release_date) AS release_year,
    COUNT(*) AS track_count,
    AVG(popularity) AS avg_popularity,
    AVG(energy) AS avg_energy,
    AVG(danceability) AS avg_danceability,
    AVG(tempo) AS avg_tempo,
    AVG(valence) AS avg_valence
FROM dbo.tracks_final
WHERE release_date IS NOT NULL
GROUP BY YEAR(release_date);
GO


