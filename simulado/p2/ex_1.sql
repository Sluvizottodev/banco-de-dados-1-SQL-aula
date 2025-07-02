-- 1) Listar apenas o nome dos fornecedores que possuem produtos com estoque acima da média vendidos no ano de 2006.

SELECT DISTINCT f.name
FROM fornecedor f 
JOIN produto p ON p.fornecedor_id = f.id
JOIN vendas v ON v.produto_id = p.id 
WHERE YEAR(v.data_venda) = 2006
    AND p.estoque > (
        SELECT AVG(p2.estoque)
        FROM produtos p2
        JOIN vendas v2 ON v2.produto_id = p2.id 
        WHERE YEAR(v2.data_venda) = 2006
    );