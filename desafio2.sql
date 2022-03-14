-- Referencia: https://stackoverflow.com/questions/43300665/sql-how-to-combine-count-results-from-multiple-tables-into-multiple-columns
SELECT
	(SELECT COUNT(sons_id) FROM SpotifyClone.sons) AS 'cancoes',
    (SELECT COUNT(artistas_id) FROM SpotifyClone.artistas) AS 'artistas',
    (SELECT COUNT(album_id) FROM SpotifyClone.albuns) AS 'albuns';