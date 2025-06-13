-- Listar o nome do aluno e o título de todos os livros de autores cujo nome seja composto por no mínimo 4 partes e que estejam emprestados para alunos de cidades com o prefixo ‘NOVA’ incluindo livros que não atendam a esses requisitos (FORA DO JOIN). Proibido usar a cláusula IN. Você não poderá utilizar o operador LIKE para a condição do prefixo.
## aluno -> livro -> autor -> livro_autor -> exemplar -> emprestimo -> aluno -> cidade

SELECT a.nome as aluno , l.titulo
FROM livro l 
LEFT JOIN livro_autor la ON (la.livro_id = l.id)
JOIN autor aut ON(la.autor_id = aut.id) 
JOIN exemplar ex ON(ex.livro_id = liv.id) 
JOIN emprestimo em ON(em.exemplar_id = ex.id) 
JOIN aluno a ON(em.aluno_matricula = a.matricula) 
JOIN cidade ci ON(a.cidade_id = ci.id)
WHERE aut.nome LIKE '% % % %'
    AND ex.status = 'EMPRESTADO'
    AND SUBSTRING (ci.nome, 1, 1) = 'NOVA';