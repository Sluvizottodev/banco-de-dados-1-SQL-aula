--> Crie a base de dados biblioteca2025 e crie as tabelas INNODB abaixo implementando todas as foreign Keys e constraints necessárias para que a operação delete seja restrita e a atualização ocorra em cascata nas tabelas que dão origem às chaves estrangeiras. 
#Dica: Comece pelas tabelas que não possuem chaves estrangeiras. - IMAGEM REFETENTE NA PASTA

CREATE DATABASE biblioteca2025;
USE biblioteca2025;
-- ASSUNTO
CREATE TABLE IF NOT EXISTS assunto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE
) ENGINE=INNODB;

-- EDITORA
CREATE TABLE IF NOT EXISTS editora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE 
) ENGINE=INNODB;

-- LIVRO
CREATE TABLE IF NOT EXISTS livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    editora_id INT NOT NULL,
    assunto_id INT NOT NULL,
    titulo VARCHAR(60) NOT NULL UNIQUE,
    ano_publicacao VARCHAR(4) NOT NULL,
    FOREIGN KEY (editora_id) REFERENCES editora(id)
        ON DELETE RESTRICT -- Restrição de exclusão caso exista livro com tal editora
        ON UPDATE CASCADE, -- atualiza automaticamente o id da tabela filho caso a pai seja alterado
    FOREIGN KEY (assunto_id) REFERENCES assunto(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=INNODB;

-- PAIS
CREATE TABLE IF NOT EXISTS pais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
) ENGINE=INNODB;

-- AUTOR
CREATE TABLE IF NOT EXISTS autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pais_id INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    FOREIGN KEY (pais_id) REFERENCES pais(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=INNODB;

-- LIVRO_AUTOR
CREATE TABLE IF NOT EXISTS livro_autor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES livro(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (autor_id) REFERENCES autor(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = INNODB;

-- EMPRESTIMO
CREATE TABLE IF NOT EXISTS emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    exemplar_id INT NOT NULL,
    aluno_matricula INT NOT NULL,
    funcionario_id INT NOT NULL,
    data_emprestimo DATETIME NOT NULL,
    data_devolucao DATETIME NOT NULL,
    FOREIGN KEY (exempalr_id) REFERENCES exemplar(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=INNODB;

-- ALUNO
CREATE TABLE IF NOT EXISTS aluno (
    matricula INT(11) NOT NULL PRIMARY KEY,
    cidade_id INT NOT NULL, 
    nome VARCHAR(40) NOT NULL,
    data_nascimento DATE NOT NULL,
    FOREIGN KEY(cidade_id) REFERENCES cidade(id)
        ON DELETE RESTRICT,
        ON UPDATE CASCADE
) ENGINE=INNODB;

-- CIDADE
CREATE TABLE IF NOT EXISTS cidade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE
) ENGINE=INNODB;
