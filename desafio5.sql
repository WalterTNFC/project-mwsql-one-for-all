SELECT
	Music.sons_nome AS cancao,
    COUNT(hr.sons_id) AS reproducoes
FROM SpotifyClone.historico_reproducao AS hr
JOIN SpotifyClone.sons AS Music ON hr.sons_id = Music.sons_id
GROUP By cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;