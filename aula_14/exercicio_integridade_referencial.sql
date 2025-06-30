--> Crie a base de dados biblioteca2025 e crie as tabelas INNODB abaixo implementando todas as foreign Keys e constraints necessárias para que a operação delete seja restrita e a atualização ocorra em cascata nas tabelas que dão origem às chaves estrangeiras. 
#Dica: Comece pelas tabelas que não possuem chaves estrangeiras. - IMAGEM REFETENTE NA PASTA

CREATE DATABASE biblioteca2025;
USE biblioteca2025;
-- GENEROS
CREATE TABLE IF NOT EXISTS assuntos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE
) ENGINE=INNODB;

