/* 2) Listar apenas o nome dos vendedores que acumularam comissão  acima de 200,00 nas vendas acima da média. */

SELECT DISTINCT ve.nome
FROM vendedor ve  
JOIN cliente c ON (c.vendedor_id = ve.id)
JOIN venda v ON (v.cliente_id = c.id)
WHERE v.valor_total > (SELECT AVG(valor_total) FROM venda)
GROUP BY ve.id 
HAVING SUM((v.valor_total*ve.comissao_percentual)/100)>200;
