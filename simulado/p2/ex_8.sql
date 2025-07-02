-- 8) Exercícios com subconsultas e outros: 

    #a) Listar o nome de todos as cidades que tiveram clientes que compraram produtos de fornecedores das UFs ‘RJ’,’SP’,’ES’ e ‘MG’ em 2006. Usar subconsulta. 
SELECT nome
FROM cidade 
WHERE id IN(
    SELECT cidade_id id FROM bairro WHERE id (
        SELECT bairro_id FROM cliente WHERE id IN (
            SELECT cliente_id FROM venda WHERE YEAR(data_venda)=2006 AND id IN(
                SELECT venda_id FROM produto_vendido WHERE produto_id IN(
                    SELECT id FROM produto WHERE fornecedor_id IN(
                        SELECT id FROM fornecedor WHERE cidade_id IN(
                            SELECT id FROM cidade WHERE uf_id IN(
                                SELECT id FROM uf WHERE sigla IN ('RJ', 'SP', 'ES', 'MG')
                            )
                        )
                    )
                )
            )
        )
    )
)

    #b) Listar o nome dos vendedores que tiveram valor de comissão acima de 500 em vendas realizadas no ano de 2006.  
SELECT ve.nome 
FROM vendedor ve 
JOIN cliente c ON (c.vendedor_id = ve.id) 
JOIN venda v ON (v.cliente_id = c.id) 
WHERE YEAR(v.data_venda)=2006
    AND ( (v.valor_total*ve.comissao_percentual)/100 ) > 500;