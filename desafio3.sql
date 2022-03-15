SELECT 
	User.usuario_nome AS usuario,
	COUNT(music.sons_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(tempo_segundos / 60), 2) AS total_minutos
    
FROM
	SpotifyClone.usuario AS User
		JOIN
	SpotifyClone.historico_reproducao AS hr ON User.usuario_id = hr.usuario_id
		JOIN
	SpotifyClone.sons AS music ON music.sons_id = hr.sons_id
GROUP BY User.usuario_nome
ORDER BY User.usuario_nome;