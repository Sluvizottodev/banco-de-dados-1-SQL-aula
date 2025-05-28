SELECT a.nome
FROM aluno a
JOIN cidade c ON c.id = a.cidade_id
JOIN emprestimo em ON em.aluno_matricula = a.matricula
JOIN exemplar ex ON ex.id = em.exemplar_id
JOIN livro l ON l.id = ex.livro_id
JOIN livro_autor la ON la.livro_id = l.id
JOIN autor aut ON aut.id = la.autor_id
JOIN pais p ON p.id = aut.pais_id
JOIN assunto ass ON ass.id = l.assunto_id
WHERE 
	ass.nome != 'MATEMATICA' 
	AND ass.nome != 'FISICA'
	AND (p.nome ='BRASIL'
	OR p.nome ='INGLATERRA')
	AND (c.nome = 'CANTAGALO'
	OR c.nome = 'CORDEIRO')
	AND SUBSTRING(a.data_nascimento, 1, 4) = '2000';