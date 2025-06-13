-- 3) Usando subconsultas, a) listar todos os alunos que nunca pegaram livros de GEOGRAFIA emprestado. b) usar JOINS para remover esses alunos.
--  a)
SELECT * 
FROM aluno a
WHERE matricula NOT IN(
    SELECT aluno_matricula
    FROM emprestimo
    WHERE exemplar_id IN (
        SELECT id
        FROM exemplar
        WHERE livro_id IN (
            SELECT l.id
            FROM livro l
            WHERE assunto_id IN (
                SELECT id 
                FROM assunto
                WHERE nome = 'GEOGRAFIA'
            )
        )
    )
)

-- b)
DELETE a.*
FROM aluno a 
LEFT JOIN emprestimo em ON (em.aluno_matricula = a.matricula)
JOIN exemplar ex ON (em.exemplar_id = ex.id)
JOIN livro liv ON (ex.livro_id = liv.id)
JOIN assunto ass ON (liv.assunto_id = ass.id)
WHERE ass.nome = 'GEOGRAFIA'
    AND a.matricula is NULL;