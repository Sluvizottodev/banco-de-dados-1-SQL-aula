/* 3) Listar apenas o nome dos 5 produtos mais vendidos em quantidade.  Só interessam produtos que venderam acima de 50 unidades. */

SELECT p.descricao as produto
FROM venda v 
JOIN produto_vendido pv ON(pv.venda_id=v.id) 
JOIN  produto p ON(pv.produto_id=p.id)  
GROUP BY p.id 
HAVING SUM(pv.quantidade) > 50
ORDER BY SUM(pv.quantidade) DESC LIMIT 5;