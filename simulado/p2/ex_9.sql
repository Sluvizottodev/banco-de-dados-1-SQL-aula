-- 9) Criar uma view que o nome do produto, o nome do fornecedor e o valor total dos 10 produtos mais vendidos em quantidade. Não interessam produtos que tenham vendido menos de 20 unidades no total.

CREATE OR REPLACE VIEW vw_top10_produtos_vendidos (
    -- apelidos pros campos mostrados na view (q aparecem no SELECT)
    produto, 
    fornecedor, 
    valor_total
) AS
SELECT 
    p.descricao,
    f.nome,
    pv.valor_total
FROM produto p 
JOIN fornecedor f ON p.fornecedor_id = f.id 
JOIN produto_vendido pv ON pv.produto_id = p.id 
GROUP BY p.id -- agrupa linhas com valores iguais p/ processar em conjunto (preferir pelo id)
HAVING COUNT(*) >= 20
ORDER BY COUNT (*) DESC
LIMIT 20;

