CREATE DATABASE biblioteca_cefel
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

USE biblioteca_cefel;

CREATE TABLE cidade (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30)
);

CREATE TABLE aluno (
  matricula INT PRIMARY KEY,
  cidade_id INT,
  nome VARCHAR(40),
  data_nascimento DATE,
  FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE pais (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30)
);

CREATE TABLE autor (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pais_id INT,
  nome VARCHAR(30),
  data_nascimento DATE,
  FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE assunto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30) UNIQUE
);

CREATE TABLE editora (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30)
);

CREATE TABLE livro (
  id INT PRIMARY KEY AUTO_INCREMENT,
  editora_id INT,
  assunto_id INT,
  titulo VARCHAR(60),
  ano_publicacao CHAR(4),
  FOREIGN KEY (editora_id) REFERENCES editora(id),
  FOREIGN KEY (assunto_id) REFERENCES assunto(id)
);

CREATE TABLE livro_autor (
  id INT PRIMARY KEY AUTO_INCREMENT,
  livro_id INT,
  autor_id INT,
  FOREIGN KEY (livro_id) REFERENCES livro(id),
  FOREIGN KEY (autor_id) REFERENCES autor(id)
);

CREATE TABLE funcionario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30)
);

CREATE TABLE exemplar (
  id INT PRIMARY KEY AUTO_INCREMENT,
  livro_id INT,
  status ENUM('INDISPONÍVEL', 'DISPONÍVEL', 'EMPRESTADO'),
  FOREIGN KEY (livro_id) REFERENCES livro(id)
);

CREATE TABLE emprestimo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  exemplar_id INT,
  aluno_matricula INT,
  funcionario_id INT,
  data_emprestimo DATETIME,
  data_devolucao DATETIME,
  FOREIGN KEY (exemplar_id) REFERENCES exemplar(id),
  FOREIGN KEY (aluno_matricula) REFERENCES aluno(matricula),
  FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);

--

-- Cidades
INSERT INTO cidade (nome) VALUES ('CANTAGALO'), ('CORDEIRO'), ('SUMIDOURO'), ('NOVA FRIBURGO');

-- Alunos
INSERT INTO aluno (matricula, cidade_id, nome, data_nascimento) VALUES
(1, 1, 'Maria Silva', '2000-05-01'),
(2, 2, 'Paulo Souza', '1999-08-15'),
(3, 3, 'Renata Lima', '2000-10-20');

-- Países
INSERT INTO pais (nome) VALUES ('BRASIL'), ('INGLATERRA'), ('EUA');

-- Autores
INSERT INTO autor (pais_id, nome, data_nascimento) VALUES
(1, 'João Brasileiro', '1970-01-01'),
(2, 'Mary English', '1965-06-06'),
(3, 'Mark USA', '1980-02-02');

-- Assuntos
INSERT INTO assunto (nome) VALUES ('REDES'), ('HARDWARE'), ('MATEMATICA'), ('FISICA'), ('QUIMICA');

-- Editoras
INSERT INTO editora (nome) VALUES ('Editora A'), ('Editora B');

-- Livros
INSERT INTO livro (editora_id, assunto_id, titulo, ano_publicacao) VALUES
(1, 1, 'Redes para Iniciantes', '2015'),
(1, 2, 'Hardware Básico', '2015'),
(2, 3, 'Matemática Aplicada', '2018'),
(2, 4, 'Física Moderna', '2017'),
(2, 5, 'Química Orgânica', '2020');

-- Livro_Autor
INSERT INTO livro_autor (livro_id, autor_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 3);

-- Funcionários
INSERT INTO funcionario (nome) VALUES ('Carlos Bibliotecário');

-- Exemplares
INSERT INTO exemplar (livro_id, status) VALUES
(1, 'EMPRESTADO'),
(2, 'EMPRESTADO'),
(3, 'DISPONÍVEL'),
(4, 'DISPONÍVEL'),
(5, 'DISPONÍVEL');

-- Empréstimos
INSERT INTO emprestimo (exemplar_id, aluno_matricula, funcionario_id, data_emprestimo, data_devolucao) VALUES
(1, 1, 1, '2023-06-01 10:00:00', '2023-06-10 10:00:00'),
(2, 2, 1, '2023-06-05 11:00:00', '2023-06-15 11:00:00');
