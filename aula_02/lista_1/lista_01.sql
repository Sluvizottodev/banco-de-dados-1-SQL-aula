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
    data_cadastro DATE NOT NULL DEFAULT NOW(),
    principio VARCHAR(100) NOT NULL, // principio ativo
);

INSERT INTO medicmento (descricao, preco_custo, estoque, fabricante, data_cadastro, pricipio)
VALUES
    ('SOMALIUM 6MG', 15.25, 28, 'ACHE', 10/09/2023, 'BROMAZEPAN'),
    ('NOVALGINA GOTAS', 12.50, 50, 'HMS', 15/10/2024, 'DIPIRONA'),
    ('TYLENOL 750MG', 14.00, 20, 'HMS', 15/10/2024, 'PARACETAMOL'),
    ('CATAFLAN 50MG', 22.30, 40, 'NOVARTIS', now(), 'DICLOFENACO'),

