-- Referencia: https://stackoverflow.com/questions/43300665/sql-how-to-combine-count-results-from-multiple-tables-into-multiple-columns
USE SpotifyClone;
SELECT
	(SELECT COUNT(sons_id) FROM sons) AS 'cancoes',
    (SELECT COUNT(artistas_id) FROM artistas) AS 'artistas',
    (SELECT COUNT(album_id) FROM albuns) AS 'albuns';