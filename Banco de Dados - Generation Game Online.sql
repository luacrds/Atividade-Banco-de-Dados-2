CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes (
id bigint auto_increment PRIMARY KEY,
nome varchar(100) NOT NULL,
descricao varchar(255)
);

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT,
    poder_defesa INT,
    nivel INT,
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Especialista em combate corpo a corpo'),
('Mago', 'Controla magias poderosas'),
('Arqueiro', 'Ataca de longa distância'),
('Assassino', 'Ataques rápidos e silenciosos'),
('Paladino', 'Mistura força e defesa com habilidades sagradas');

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Curupira', 2500, 1200, 10, 1),
('Iara', 3000, 800, 15, 2),
('Matinta', 1800, 1900, 12, 3),
('Mapinguari', 2200, 1000, 9, 4),
('Jaci', 2100, 1600, 13, 5),
('Cuca', 1700, 900, 11, 2),
('Boto', 2600, 1100, 14, 1),
('Caipora', 2000, 1500, 8, 3);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT 
    tb_personagens.nome AS NomePersonagem,
    tb_classes.nome AS Classe,
    tb_personagens.nivel,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id;

SELECT 
    tb_personagens.nome AS NomePersonagem,
    tb_classes.nome AS Classe
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.nome = 'Arqueiro';

