-- Lista de exercícios 1.0

-- 1) Criar a base de dados farmacia definindo tipo de caracterere e acentuação.

CREATE DATABASE IF NOT EXISTS farmacia DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

-- 2) Na base criada acima, criar a tabela medicamento com os campos id (chave primária artificial), descrição, preco_de_custo, estoque e fabricante. Todos os campos devem ser de preenchimento obrigatório. Regra: Não pode haver uma combinação de descrição e fabricante repetida. Resolva isso.

CREATE TABLE IF NOT EXISTS medicamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL,
    preco_de_custo DECIMAL(9, 2) NOT NULL,
    estoque INT NOT NULL,
    fabricante VARCHAR(20) NOT NULL,
    UNIQUE INDEX unq_medicamento__descricao__fabricante (descricao, fabricante)
) ENGINE = INNODB;

#Dica: Devemos adotar um padrão de nomenclatura para índices únicos. Ex: unq_tabela__campo1__campo2.

-- 3) Altere a tabela acima adicionando o campo data_cadastro do tipo DATE e um campo chamado principio. Ex: O princípio ativo da Novalgina é dipirona.

ALTER TABLE medicamento
ADD COLUMN data_cadastro DATE NOT NULL,
ADD COLUMN principio VARCHAR(30) NOT NULL;

-- 4) Use a função now() para definir o valor default para o campo data_cadastro de todos os medicamentos.

ALTER TABLE medicamento
CHANGE COLUMN data_cadastro data_cadastro DATE NOT NULL DEFAULT now();

-- 5) Altere a coluna principio para principio_ativo.

ALTER TABLE medicamento
CHANGE COLUMN principio principio_ativo VARCHAR(30) NOT NULL;

-- 6) Faça as seguintes inserções na tabela criada:

INSERT INTO medicamento(
    descricao, 
    preco_de_custo, 
    estoque, fabricante, 
    data_cadastro, 
    principio_ativo
) VALUES(
    ‘SOMALIUM 6MG’, 15.25, 28, ‘ACHE’, ‘2023-09-10’, ‘BROMAZEPAN’), (‘NOVALGINA GOTAS’,12.50, 50, ‘HMS’, ‘2024-10-15’,’DIPIRONA’), (‘TYLENOL 750MG’, 14.00, 20, ‘JANSEN’, now(), ‘PARACETAMOL’), (‘CATAFLAN 50MG’, 22.30, 40, ‘NOVARTIS’, now(), ‘DICLOFENACO SÓDICO’), (‘DORICO 750MG’, 12.99, 25, ‘SANOFI’, ‘2023-11-23’, ‘PARACETAMOL’), (‘BINOTAL 500MG’,48.00, 15, ‘BAYER’, now(), ‘AMPICILINA’), (‘DELTAREN 50MG’, 20.56, 40, ‘DELTA’, now(), ‘DICLOFENACO SÓDICO’
);

-- 7) Altere o campo data_cadastro para data_de_cadastro do tipo DATE e obrigatório.

ALTER TABLE medicamento
CHANGE COLUMN data_cadastro data_de_cadastro DATE NOT NULL;

-- 8) Altere principio_ativo para que seja de preenchimento obrigatório e que o valor default seja ‘DESCONECIDO’.

ALTER TABLE medicamento 
CHANGE COLUMN principio_ativo principio_ativo VARCHAR(30) NOT NULL DEFAULT ‘DESCONHECIDO’;

-- 9) Aumente em 20% o preço de custo de todos os produtos cujo princípio é paracetamol.

UPDATE medicamento 
SET preco_de_custo = preco_de_custo * 1.20 
WHERE principio_ativo=’PARACETAMOL’;

-- 10) Considerando uma margem de lucro de 30%, escreva uma consulta que mostre a descrição, o principio ativo, o estoque, o preço de custo e o preço de venda de todos os produtos com estoque acima de 20 e cujo nome comece com as letras A, B, C e N.

SELECT descricao, principio_ativo, estoque, preco_de_custo, 
ROUND( (preco_de_custo * 1.3), 2) as preco_de_venda 
FROM medicamento 
WHERE estoque>20 
AND SUBSTRING(descricao,1,1) IN(‘A’,’B’,’C’,’N’);

-- 11) Crie uma coluna chamada margem_de_lucro de preenchimento obrigatório e valor default 42.87.

ALTER TABLE medicamento
ADD COLUMN margem_de_lucro DECIMAL(9, 2) NOT NULL DEFAULT 42.87;

-- 12) Escreva uma consulta que retorne a descrição, o preço de custo e o preço de venda de todos os produtos em ordem decrescente de preço.

SELECT descricao, 
principio_ativo, 
estoque, 
preco_de_custo, (
    preco_de_custo + ((preco_de_custo * margem_de_lucro) / 100 ) as preco_de_venda 
    FROM medicamento 
    ORDER BY preco_de_venda DESC;

-- 13) Escreva uma consulta que retorne em ordem alfabética e sem repetições, todos os princípios ativos.

SELECT DISTINCT principio_ativo
FROM medicamento
ORDER BY principio_ativo;

-- 14) Escreva uma consulta que retorne a descrição e a data de cadastro de todos os medicamentos no formato brasileiro (dia/mês/ano). Proibido utilizar funções de data.

SELECT descricao, 
CONCAT(
    SUBSTRING(data_de_cadastro,9,2), ‘/’, SUBSTRING(data_de_cadastro,6,2), ‘/’, SUBSTRING(data_de_cadastro,1,4) 
) as data_br FROM medicamento;