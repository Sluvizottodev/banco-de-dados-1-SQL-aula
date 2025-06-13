-- 4)Crie a tabela livro_autor (esquema acima) com a coluna id auto incrementável e de modo que não aceite combinações repetidas de livro e autor.
CREATE TABLE livro_autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT NOT NULL,
    autor_id INT NOT NULL,
    UNIQUE INDEX unq_livro_autor (livro_id, autor_id)
)ENGINE=INNODB;