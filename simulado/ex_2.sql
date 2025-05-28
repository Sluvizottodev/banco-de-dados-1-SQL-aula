SELECT l.titulo, e.nome
FROM livro l
JOIN editora e ON e.id = l.editora_id
JOIN livro_autor la ON la.livro_id = l.id
JOIN autor a ON a.id = la.autor_id
JOIN exemplar ex ON l.id = ex.livro_id
JOIN emprestimo em ON em.exemplar_id = e.id
JOIN aluno alu ON alu.matricula = em.aluno_matricula
JOIN cidade c ON c.id = alu.cidade_id
WHERE 
NOT(
    a.nome LIKE 'A%' 
    AND a.nome LIKE 'F%' 
    AND a.nome LIKE 'G%'
	)
AND c.nome NOT LIKE '% % %'


