UPDATE livro l
LEFT JOIN exemplar e ON l.id = e.livro_id
SET l.situacao = 'INATIVO'
WHERE e.id IS NULL;
