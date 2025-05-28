-- join
SELECT l.titulo
FROM livro l
JOIN livro_autor la ON la.livro_id = l.id
JOIN autor a ON a.id = la.autor_id
JOIN pais p ON p.id = a.pais_id
WHERE p.nome = 'BRASIL';

-- subconsulta
SELECT titulo
FROM livro
WHERE id IN (
    SELECT la.livro_id
    FROM livro_autor la
    JOIN autor a ON a.id = la.autor_id
    JOIN pais p ON p.id = a.pais_id
    WHERE p.nome = 'BRASIL'
);
