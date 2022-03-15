SELECT 
    Users.usuario_nome AS usuario,
    IF(MAX(hr.reproducao_data) LIKE '2021%',
        'Usuário ativo',
        'Usuário inativo') AS condicao_usuario
 FROM
    SpotifyClone.usuario Users
        JOIN
    SpotifyClone.historico_reproducao AS hr ON Users.usuario_id = hr.usuario_id
 GROUP BY usuario
 ORDER BY usuario