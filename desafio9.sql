SELECT COUNT(hr.usuario_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.usuario AS User
JOIN SpotifyClone.historico_reproducao AS hr ON User.usuario_id = hr.usuario_id
WHERE User.usuario_nome = 'Bill';