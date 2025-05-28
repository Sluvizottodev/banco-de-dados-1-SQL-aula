CREATE TABLE assunto(
	id INT AUTO_INCREMENT PRIMARY KEY
    nome VARCHAR(100) UNIQUE
);

ALTER TABLE aluno 
ADD email_institucional VARCHAR(100)

UPDATE aluno
SET nome = 'João da Silva'
WHERE cidade_id = 1 AND nome = 'João Silva';
