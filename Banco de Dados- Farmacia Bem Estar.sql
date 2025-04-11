CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    uso_destinado VARCHAR(255)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(6,2),
    fabricante VARCHAR(100),
    tarja_preta BOOLEAN,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, uso_destinado) VALUES
('Analgésico', 'Alívio de dores e febre'),
('Antialérgico', 'Tratamento de alergias'),
('Controlado', 'Uso controlado com prescrição'),
('Contraceptivo', 'Prevenção da gravidez'),
('Vitaminas', 'Reposição de nutrientes');

INSERT INTO tb_produtos (nome, preco, fabricante, tarja_preta, categoria_id) VALUES
('Dipirona', 12.50, 'Neo Química', false, 1),
('Dramin', 18.90, 'Teuto', false, 2),
('Ritalina', 150.00, 'Novartis', true, 3),
('Venvanse', 420.00, 'Takeda', true, 3),
('Qlaira', 90.00, 'Bayer', false, 4),
('Centrum', 65.00, 'Pfizer', false, 5),
('Cimegripe', 8.99, 'EMS', false, 1),
('Claritin', 45.00, 'Bayer', false, 2);

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.preco,
    tb_categorias.tipo AS Categoria,
    tb_categorias.uso_destinado
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.preco,
    tb_categorias.tipo AS Categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = 'Vitaminas';