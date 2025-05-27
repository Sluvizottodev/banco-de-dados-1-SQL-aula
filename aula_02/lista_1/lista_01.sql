CREATE DATABASE IF NOT EXISTS farmacia
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE farmacia;

CREATE TABLE medicamento (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    preco_custo DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE,
    principio VARCHAR(100) NOT NULL
);

INSERT INTO medicamento (descricao, preco_custo, estoque, fabricante, data_cadastro, principio)
VALUES
    ('SOMALIUM 6MG', 15.25, 28, 'ACHE', '2023-09-10', 'BROMAZEPAN'),
    ('NOVALGINA GOTAS', 12.50, 50, 'HMS', '2024-10-15', 'DIPIRONA'),
    ('TYLENOL 750MG', 14.00, 20, 'HMS', '2024-10-15', 'PARACETAMOL'),
    ('CATAFLAN 50MG', 22.30, 40, 'NOVARTIS', CURRENT_DATE, 'DICLOFENACO');

ALTER TABLE medicamento
RENAME COLUMN data_cadastro TO data_de_cadastro;

ALTER TABLE medicamento
MODIFY COLUMN principio VARCHAR(100) NOT NULL DEFAULT 'DESCONHECIDO';

UPDATE medicamento
SET preco_custo = preco_custo * 1.2
WHERE UPPER(principio) = 'PARACETAMOL';

SELECT 
    descricao, 
    principio, 
    estoque, 
    preco_custo, 
    preco_custo * 3.0 AS preco_venda 
FROM 
    medicamento
WHERE 
    estoque > 20 
    AND(
        descricao LIKE '%N%' OR 
        descricao LIKE '%A%' OR 
        descricao LIKE 'C%' OR 
        descricao LIKE 'B%'
    );

ALTER TABLE medicamento
ADD COLUMN margem_de_lucro DECIMAL(5,2) NOT NULL DEFAULT 42.87;

SELECT
    descricao,
    preco_custo,
    preco_custo * margem_de_lucro / 100 AS preco_venda,
ORDER BY
    preco_custo DESC;

    