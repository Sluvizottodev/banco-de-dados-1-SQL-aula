SELECT l.titulo
FROM livro l
JOIN assunto a ON l.assunto_id = a.id
JOIN exemplar e ON l.id = e.livro_id
JOIN emprestimo emp ON e.id = emp.exemplar_id
JOIN aluno al ON emp.aluno_matricula = al.matricula
WHERE a.nome IN ('REDES' , 'HARDWARE')
	AND l.ano_publicacao = '2015'
    AND e.status = 'EMPRESTADO'
    AND (
        SUBSTRING(al.nome,1,1) = 'M' OR
		SUBSTRING(al.nome,1,1) = 'P' OR
        SUBSTRING(al.nome,1,1) = 'R' 
    )
ORDER BY ASC
LIMIT 10 OFFSET 20