DELETE ex 
FROM exemplar ex
LEFT JOIN livro l ON l.id = ex.livro_id
WHERE l.id is NULL;