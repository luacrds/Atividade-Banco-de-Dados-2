CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao VARCHAR(100)
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    preco DECIMAL(8,2),
    duracao_horas INT,
    nivel VARCHAR(50),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Programação', 'Cursos de lógica e linguagens de programação'),
('Design Gráfico', 'Criação de imagens e edição visual'),
('Marketing Digital', 'Divulgação de produtos e redes sociais'),
('Idiomas', 'Aprendizado de línguas'),
('Dados', 'Análise e visualização de dados');

INSERT INTO tb_cursos (nome_curso, preco, duracao_horas, nivel, categoria_id) VALUES
('Curso de Java Básico', 550.00, 40, 'Iniciante', 1),
('Curso de Python Completo', 700.00, 60, 'Intermediário', 1),
('Photoshop para Iniciantes', 450.00, 30, 'Iniciante', 2),
('Marketing no Instagram', 800.00, 35, 'Avançado', 3),
('Curso de Inglês A1', 500.00, 45, 'Básico', 4),
('Power BI do Zero', 900.00, 50, 'Intermediário', 5),
('Curso de Java Avançado', 1000.00, 70, 'Avançado', 1),
('Design para Social Media', 480.00, 25, 'Intermediário', 2);

SELECT * FROM tb_cursos WHERE preco > 500.00;

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

SELECT 
    tb_cursos.nome_curso,
    tb_cursos.preco,
    tb_categorias.nome_categoria,
    tb_categorias.descricao
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id;

SELECT 
    tb_cursos.nome_curso,
    tb_cursos.preco,
    tb_categorias.nome_categoria
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome_categoria = 'Programação';