/* 4) Listar o nome dos produtos vendidos em 2006 para clientes de  cidades que não tenham nome composto. Usar subconsulta. */
SELECT p.nome
FROM produto p 
WHERE id IN(
    SELECT produto_id FROM produto_vendido WHERE venda_id IN (
        SELECT id FROM venda WHERE YEAR(venda.datavenda) = 2006 AND cliente_id IN (
            SELECT id FROM cliente WHERE bairro_id IN (
                SELECT id FROM bairro WHERE cidade_id IN (
                    SELECT id FROM cidade 
                    WHERE  cidade.nome NOT LIKE '% %'
                )
            )
        )
    )
);  