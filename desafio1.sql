-- Dropa se já existir
DROP DATABASE IF EXISTS SpotifyClone;

-- Criar banco de dados SpotifyClone 
CREATE DATABASE SpotifyClone;

-- Tabela de planos (planos-id é a chave primária e inteira)
CREATE TABLE SpotifyClone.plano (
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    plano_nome VARCHAR(255),
    plano_valor DEC(5 , 2 )
)  ENGINE=INNODB;

-- Criação da tabela
CREATE TABLE SpotifyClone.usuario (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_nome VARCHAR(255),
    usuario_data_assinatura DATE,
    usuario_idade INT,
    plano_id INT,
    FOREIGN KEY (plano_id)
        REFERENCES plano (plano_id)
)  ENGINE=INNODB;

-- Criação da tabela de artistas
CREATE TABLE SpotifyClone.artistas (
    artistas_id INT AUTO_INCREMENT PRIMARY KEY,
    artistas_nome VARCHAR(255)
)  ENGINE=INNODB;

-- Criação da tabela de albuns
CREATE TABLE SpotifyClone.albuns (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_nome VARCHAR(255),
    album_ano_lancamento INT,
    artistas_id INT,
    FOREIGN KEY (artistas_id)
        REFERENCES artistas (artistas_id)
)  ENGINE=INNODB;

-- Criação da tabela de sons
CREATE TABLE SpotifyClone.sons (
    sons_id INT AUTO_INCREMENT PRIMARY KEY,
    sons_nome VARCHAR(255),
    album_id INT,
    tempo_segundos INT,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
)  ENGINE=INNODB;

-- Criação de tabela de historico de reproduçao
CREATE TABLE SpotifyClone.historico_reproducao (
    usuario_id INT,
    sons_id INT,
    reproducao_data DATETIME,
    CONSTRAINT PK_history PRIMARY KEY (usuario_id , sons_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (sons_id)
        REFERENCES sons (sons_id)
)  ENGINE=INNODB;

-- Criação de tabela de artistas
CREATE TABLE SpotifyClone.artistas_seguidos(
    usuario_id INT,
    artistas_id INT,
    CONSTRAINT PRIMARY KEY (usuario_id , artistas_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (artistas_id)
        REFERENCES artistas (artistas_id)
)  ENGINE=INNODB;

-- Adicionar informações na tabela de planos
INSERT INTO SpotifyClone.plano (plano_nome, plano_valor) VALUES
('gratuito', 0.00),
('familiar', 7.99),
('pessoal', 6.99),
('universitÃ¡rio', 5.99);

-- Adicionar informações na tabela de usuarios
INSERT INTO SpotifyClone.usuario (usuario_nome, usuario_data_assinatura, usuario_idade, plano_id) VALUES
('Thati', '2019-10-20', 23, 1), 
('Cintia', '2017-12-30', 35, 2), 
('Bill', '2019-06-05', 20, 4), 
('Roger', '2020-05-13', 45, 3),
('Norman', '2017-02-17', 58, 2),
('Patrick', '2017-01-06', 33, 2),
('Vivian', '2018-01-05', 26, 4),
('Carol', '2018-02-14', 19, 4),
('Argelina', '2018-04-29', 42, 2),
('Paul', '2017-01-17', 46, 2);

-- Adicionar informações na tabela de artistas
INSERT INTO SpotifyClone.artistas (artistas_nome) VALUES
('Walter Phoenix'), 
('Peter Strong'), 
('Lance Day'), 
('Freedie Shannon'),
('Tyler Isle'),
('Fog');

-- Adicionar informações na tabela de albuns
INSERT INTO SpotifyClone.albuns(album_nome, artist_id, album_ano_lancamento) VALUES 
('Envious', 1, 1990),
('Exuberant', 1, 1993),
('Hallowed Steam', 2, 1995),
('Incandescent', 3, 1998),
('Temporary Culture', 4, 2001),
('Library of liberty', 4, 2003),
('Chained Down', 5, 2007),
('Cabinet of fools', 5, 2012),
('No guarantees', 5, 2015),
('Apparatus', 6, 2015);

-- Adicionar informações na tabela de sons
INSERT INTO SpotifyClone.sons(sons_nome, album_id, tempo_segundos) VALUES
('Soul For Us', 1, 200),
('Reflections Of Magic', 1, 163),
('Dance With Her Own', 1, 116),
('Troubles Of My Inner Fire', 2, 203),
('Time Fireworks', 2, 152),
('Magic Circus', 3, 105),
('Honey, So Do I', 3, 207),
("Sweetie, Let's Go Wild", 3, 139),
('She Knows', 3, 244),
('Fantasy For Me', 4, 100),
('Celebration Of More', 4, 146),
('Rock His Everything', 4, 223),
('Home Forever', 4, 231),
('Diamond Power', 4, 241),
("Let's Be Silly", 4, 132),
('Thang Of Thunder', 5, 240),
('Words Of Her Life', 5, 185),
('Without My Streets', 5, 176),
('Need Of The Evening', 6, 190),
('History Of My Roses', 6, 222),
('Without My Love', 6, 111),
('Walking And Game', 6, 123),
('Young And Father', 6, 197),
('Finding My Traditions', 7, 179),
('Walking And Man', 7, 229),
('Hard And Time', 7, 135),
('Honey. Im A Lone Wolf', 7, 150),
('She Thinks I Wint Stay Toninght', 8, 166),
('He Heard Youre Bad For Me', 8, 154),
('He Hopes We Cant Stay', 8, 210),
('I Know I Know', 8, 117),
('Hes Walking Away', 9, 159),
('Hes Troube', 9, 138),
('I Heard I Want To Bo Alone', 9, 120),
('I Ride Alone', 9, 151),
('Honey', 10, 79),
('You Cheated On Me', 10, 95),
('Wouldnt It Be Nice', 10, 213),
('Baby', 10, 136),
('You Make Me Feel So..', 10, 83);

-- Adicionar informações na tabela de historico
INSERT INTO SpotifyClone.historico_reproducao(usuario_id, sons_id, historico_reproducao) VALUES
(1, 36, '2020-02-28 10:45:55'),
(1, 25, '2020-05-02 05:30:35'),
(1, 23, '2020-03-06 11:22:33'),
(1, 14, '2020-08-05 08:05:17'),
(1, 15, '2020-09-14 16:32:22'),
(2, 34, '2020-01-02 07:40:33'),
(2, 24, '2020-05-16 06:16:22'),
(2, 21, '2020-10-09 12:27:48'),
(2, 39, '2020-09-21 13:14:46'),
(3, 6, '2020-11-13 16:55:13'),
(3, 3, '2020-12-05 18:38:30'),
(3, 26, '2020-07-30 10:00:00'),
(4, 2, '2021-08-15 17:10:10'),
(4, 35, '2021-07-10 15:20:30'),
(4, 27, '2021-01-09 01:44:33'),
(5, 7, '2020-07-03 19:33:28'),
(5, 12, '2017-02-24 21:14:22'),
(5, 14, '2020-08-06 15:23:43'),
(5, 1, '2020-11-10 13:52:27'),
(6, 38, '2019-02-07 20:33:48'),
(6, 29, '2017-01-24 00:31:17'),
(6, 30, '2017-10-12 12:35:20'),
(6, 22, '2018-05-29 14:56:41'),
(7, 5, '2018-05-09 22:30:49'),
(7, 4, '2020-07-27 12:52:58'),
(7, 11, '2018-01-16 18:40:43'),
(8, 39, '2018-03-21 16:56:40'),
(8, 40, '2020-10-18 13:38:05'),
(8, 32, '2019-05-25 08:14:03'),
(8, 33, '2021-08-15 21:37:09'),
(9, 16, '2021-05-24 17:23:45'),
(9, 17, '2018-12-07 22:48:52'),
(9, 8, '2021-03-14 06:14:26'),
(9, 9, '2020-04-01 03:36:00'),
(10, 20, '2017-02-06 08:21:34'),
(10, 21, '2017-12-04 05:33:43'),
(10, 12, '2017-07-27 05:24:49'),
(10, 13, '2017-12-25 01:03:57');

-- Adicionar informações na tabela de artistas
INSERT INTO SpotifyClone.artistas_seguidos(usuario_id, artistas_id) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 3),
(6, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 5),
(9, 6),
(9, 4),
(9, 3),
(10, 2),
(10, 6);