/* 1) Listar apenas o nome dos fornecedores que possuem produtos com  preço de custo acima da média vendidos para clientes com nome  composto por no mínimo 3 partes. */

SELECT DISTINCT f.nome 
FROM produto p 
JOIN fornecedor f ON (p.fornecedor_id = f.id)
JOIN produto_vendido pv ON(pv.produto_id = p.id)
JOIN venda v ON (pv.venda_id = v.id)
JOIN cliente c ON (v.cliente_id = c.id)
WHERE p.pcusto > (SELECT AVG(pcusto) FROM produto)
    AND c.nome LIKE '% % %'