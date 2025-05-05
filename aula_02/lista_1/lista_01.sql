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

