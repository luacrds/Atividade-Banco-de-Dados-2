CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    origem VARCHAR(100)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(6,2),
    fornecedor VARCHAR(100),
    peso_kg DECIMAL(4,2),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, origem) VALUES
('Bovina', 'Fazenda Boa Carne'),
('Suína', 'Sítio Três Porquinhos'),
('Aves', 'Granjas do Sul'),
('Peixes', 'Pescados Mar Azul'),
('Cortes Especiais', 'Distribuidora Premium');

INSERT INTO tb_produtos (nome, preco, fornecedor, peso_kg, categoria_id) VALUES
('Picanha', 120.00, 'Boa Carne', 1.00, 1),
('Costela Bovina', 85.50, 'Fazenda Sul', 2.00, 1),
('Linguiça Suína', 35.00, 'Porco Feliz', 1.50, 2),
('Pernil Suíno', 70.00, 'Sítio Três Porquinhos', 3.00, 2),
('Frango Inteiro', 25.00, 'Granjas do Sul', 2.50, 3),
('Coxa de Frango', 18.00, 'Granjas do Sul', 1.20, 3),
('Tilápia', 60.00, 'Mar Azul', 1.00, 4),
('Filé Mignon', 150.00, 'Distribuidora Premium', 0.80, 5);

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.preco,
    tb_categorias.tipo AS Categoria,
    tb_categorias.origem AS Origem
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
WHERE tb_categorias.tipo = 'Aves';