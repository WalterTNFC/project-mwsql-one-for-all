SELECT
    ROUND(MIN(planoValor.plano_valor), 2) AS faturamento_minimo,
    ROUND(MAX(planoValor.plano_valor), 2) AS faturamento_maximo,
    ROUND(AVG(planoValor.plano_valor), 2) AS faturamento_medio,
    ROUND(SUM(planoValor.plano_valor), 2) AS faturamento_total
FROM SpotifyClone.usuario AS User
JOIN SpotifyClone.plano AS planoValor ON planoValor.plano_id = User.plano_id