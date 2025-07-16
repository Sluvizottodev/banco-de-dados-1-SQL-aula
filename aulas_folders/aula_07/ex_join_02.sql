-- Exercicio 1:
-- Listar apenas o nome dos alunos (apenas um de cada) que NÃO sejam das cidades ‘CARMO’ e ‘MACUCO’,
-- nascidos no ano 2002 e que tenham feito empréstimo de livros de HISTÓRIA e GEOGRAFIA.
-- Proibido usar funções de data, o operador LIKE e a cláusula IN.

SELECT DISTINCT a.nome 
FROM aluno a
JOIN cidade c ON a.cidade_id = c.id  
JOIN emprestimo e ON e.aluno_matricula = a.matricula
JOIN exemplar ex ON ex.id = e.exemplar_id
JOIN livro l ON l.id = ex.livro_id
JOIN assunto ass ON ass.id = l.assunto_id
WHERE (c.cidade_nome != 'CARMO' 
OR c.cidade_nome != 'MACUCO') 
AND LEFT(a.data_nascimento, 4) = '2002'
AND ass.nome = 'HISTÓRIA' AND ass.nome = 'GEOGRAFIA';


-- Exercicio 2:
-- Listar o título do livro e o nome da editora para todos os livros de autores cujo nome NÃO 
-- comece com as letras A, F ou G e que tenham sido emprestados para alunos de cidades cujo 
-- nome NÃO seja composto. Proibido usar a cláusula IN e o operador SUBSTRING.

SELECT l.titulo, e.nome
FROM livro l 
JOIN livro_autor la ON la.livro_id = l.id
JOIN autor a ON a.id = la.autor_id
JOIN editora e ON e.id = l.editora_id
JOIN exemplar ex ON ex.livro_id = l.id
JOIN emprestimo em ON em.exemplar_id = ex.id
JOIN aluno al ON al.matricula = em.aluno_matricula
JOIN cidade c ON c.id = al.cidade_id
WHERE NOT(a.nome LIKE 'A%' a.nome OR a.nome LIKE 'F%' OR a.nome LIKE 'G%')
WHERE al.cidade NOT LIKE '% %';


-- Exercicio 3:
-- Listar, sem repetições, o nome dos funcionários que emprestaram livros em setembro de 2002.
-- Proibido usar funções de data e substring.

SELECT DISTINCT f.nome
FROM emprestimo em 
JOIN funcionario f ON f.id = em.funcionario_id
WHERE em.data_emprestimo LIKE '2002-09%';


-- Exercicio 4:
-- Listar o nome dos livros de REDES e PROGRAMAÇÃO publicados no ano 2010 e que se encontram 
-- emprestados para alunos cujo nome comece com as letras M, P e R. 
-- Os registros devem ser exibidos em ordem alfabética de assunto, descartando os 10 primeiros registros e exibindo 10 registros.
-- Proibido usar like e funções de data. Uso obrigatória da cláusula IN p/ os casos em que for pertinente.

SELECT l.nome
FROM livro
JOIN assunto ass ON (l.assunto_id = ass.id)
WHERE ass.nome IN ('REDES' OR 'PROGRAMAÇÃO')
AND l.ano_publicado  = '2010'
AND SUBSTRING(aluno.nome, 1, 1)IN ('M%', 'P', 'R%')
ORDER BY ass ASC LIMIT 10,10;
