CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(6,2),
    tamanho VARCHAR(50),
    disponivel BOOLEAN,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, descricao) VALUES
('Tradicional', 'Pizzas com sabores clássicos e populares'),
('Doce', 'Pizzas com coberturas doces'),
('Vegetariana', 'Pizzas sem ingredientes de origem animal'),
('Premium', 'Pizzas com ingredientes especiais'),
('Especial da Casa', 'Sabores únicos da pizzaria');

INSERT INTO tb_pizzas (nome, preco, tamanho, disponivel, categoria_id) VALUES
('Calabresa', 48.90, 'Grande', true, 1),
('Margherita', 42.00, 'Média', true, 3),
('Brigadeiro', 55.00, 'Grande', true, 2),
('Portuguesa', 49.90, 'Grande', true, 1),
('Chocolate com Morango', 60.00, 'Grande', true, 2),
('Quatro Queijos', 50.00, 'Grande', true, 4),
('Veggie Especial', 53.00, 'Grande', true, 3),
('Pizza da Casa', 65.00, 'Grande', true, 5);

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT 
    tb_pizzas.nome AS NomePizza,
    tb_pizzas.preco,
    tb_categorias.tipo AS Categoria
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id;

SELECT 
    tb_pizzas.nome AS NomePizza,
    tb_pizzas.preco,
    tb_categorias.tipo AS Categoria
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = 'Doce';

