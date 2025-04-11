CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    setor VARCHAR(100)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(6,2),
    fornecedor VARCHAR(100),
    quantidade INT,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, setor) VALUES
('Hidráulica', 'Casa e Banheiro'),
('Elétrica', 'Instalações'),
('Ferramentas', 'Manutenção'),
('Materiais de Acabamento', 'Revestimentos'),
('Tintas', 'Pintura');

INSERT INTO tb_produtos (nome, preco, fornecedor, quantidade, categoria_id) VALUES
('Torneira de Cozinha', 120.00, 'HidroLar', 10, 1),
('Chuveiro Elétrico', 140.00, 'Ducha+Tech', 15, 1),
('Fio de Cobre 10mm', 95.00, 'EletrikCenter', 25, 2),
('Interruptor Simples', 25.00, 'Casa Elétrica', 50, 2),
('Martelo de Borracha', 60.00, 'FerraMais', 20, 3),
('Trena 5m', 30.00, 'Obra Fácil', 40, 3),
('Revestimento Cerâmico', 160.00, 'Construpiso', 100, 4),
('Tinta Acrílica Branca', 110.00, 'ColorLar', 35, 5);

SELECT * FROM tb_produtos WHERE preco > 100.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.preco,
    tb_categorias.tipo AS Categoria,
    tb_categorias.setor AS Setor
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
WHERE tb_categorias.tipo = 'Hidráulica';