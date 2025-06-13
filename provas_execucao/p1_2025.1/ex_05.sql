-- 5)Altere a tabela funcionario adicionando a coluna situação que só poderá aceitar os seguintes valores ‘ATIVO’,’INATIVO’,e ‘RECONTRATADO’. A coluna deverá ser posicionada após o campo nome.
ALTER TABLE funcionario 
ADD COLUMN situacao
ENUM('ATIVO', 'INATIVO', 'RECONTRATADO') AFTER nome;