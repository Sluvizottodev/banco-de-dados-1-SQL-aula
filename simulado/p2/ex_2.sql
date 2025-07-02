-- 2) Listar apenas o nome dos vendedores que acumularam comissão acima de 200,00 nas vendas acima da média.

SELECT v.nome
FROM vendedor v 
JOIN venda ve ON ve.vendedor_id = v.id 
WHERE comissao > (
    SELECT AVG(valor)
    FROM venda
)
GROUP BY v.id, v.nome
HAVING SUM(s.comissao) > 200.00;