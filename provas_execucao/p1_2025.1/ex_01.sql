--1) Listar, sem duplicidades, o nome dos funcionários que realizaram empréstimos de livros ainda não devolvidos de autores cujo nome comece com as letras H, M e N. Os registros devem ser ordenados pelo assunto dos livros. Essa consulta deve corresponder à 3ª página de uma paginação que exibe 6 registros por vez. Proibido usar like e a cláusula IN.
## pro join: funcionario -> emprestimo -> exemplar -> livro -> livro_autor -> autor -> assunto.

SELECT DISTINCT f.nome
FROM funcionario f

JOIN emprestimo em ON (em.funcionario_id = f.id)
JOIN exemplar e ON (e.id = em.exemplar_id)
JOIN livro l ON (l.id = e.livro_id)
JOIN livro_autor la ON (la.livro_id = l.id)
JOIN autor a ON (a.id = la.autor_id)
JOIN assunto ass ON (ass.id = l.assunto_id)

WHERE ex.status = 'EMPRESTADO'
    AND (
        SUBSTRING (
            a.nome, 1, 1 = 'H'
        )
        SUBSTRING (
            a.nome, 1, 1 = 'M'
        )
        SUBSTRING (
            a.nome, 1, 1 = 'N'
        )    
    )

ORDER BY ass.nome 
LIMIT 12, 6;

