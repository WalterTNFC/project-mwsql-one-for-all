SELECT 
artista.artistas_nome AS artista,
album.album_nome AS album
FROM SpotifyClone.artistas AS artista
JOIN SpotifyClone.albuns AS album ON album.artistas_id = artista.artistas_id 
WHERE  artistas_nome = 'Walter Phoenix'
ORDER BY album; 