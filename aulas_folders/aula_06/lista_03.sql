-- Lista de exercícios n° 3 (basevendasv2 fornecida pelo professor)

-- 1) Usando a cláusula IN( ), monte uma consulta que retorne todos os clientes cadastrados
-- entre ‘10/01/2004’ e ‘20/12/2005’ que sejam do bairro “CENTRO”
-- e das cidades de NOVA FRIBURGO, CORDEIRO, CANTAGALO e BOM JARDIM, cujo endereço esteja preenchido.

SELECT c.*, ci.nome
FROM cliente c
JOIN bairro b ON c.bairro_id = b.id
JOIN cidade ci ON b.cidade_id = ci.id
WHERE b.nome = 'CENTRO'
  AND c.data_cadastro BETWEEN '2004-01-10' AND '2005-12-20'
  AND ci.nome IN ('NOVA FRIBURGO', 'CORDEIRO', 'CANTAGALO', 'BOM JARDIM')
  AND c.endereco <> ''
  AND c.endereco IS NOT NULL;

-- 2) Usando a cláusula IN( ), mostre todos os clientes das cidades de CORDEIRO, ITAOCARA e CANTAGALO,
-- cujo endereço não esteja preenchido.

SELECT c.*, ci.nome
FROM cliente c
JOIN bairro b ON c.bairro_id = b.id
JOIN cidade ci ON b.cidade_id = ci.id
WHERE ci.nome IN ('ITAOCARA', 'CORDEIRO', 'CANTAGALO')
  AND (c.endereco = '' OR c.endereco IS NULL)
ORDER BY c.endereco;

-- 3a) Usando JOINS, retorne a descrição do fornecedor, a descrição e o estoque do produto:

SELECT f.nome AS fornecedor, p.descricao AS produto, p.estoque
FROM fornecedor f
JOIN produto p ON p.fornecedor_id = f.id;

-- 3b) Inclua produtos que não têm fornecedor cadastrado:

SELECT f.nome AS fornecedor, p.descricao AS produto, p.estoque
FROM fornecedor f
RIGHT JOIN produto p ON p.fornecedor_id = f.id
ORDER BY fornecedor;

-- 3c) Inclua fornecedores que não têm produtos cadastrados:

SELECT f.nome AS fornecedor, p.descricao AS produto, p.estoque
FROM fornecedor f
LEFT JOIN produto p ON p.fornecedor_id = f.id
ORDER BY produto;

-- 4) Listar data da venda (formato brasileiro), nome do cliente, nome do vendedor,
-- valor total da venda e valor da comissão do vendedor para vendas de 2006:

SELECT CONCAT(SUBSTRING(v.data_venda,9,2), '/', SUBSTRING(v.data_venda,6,2), '/', SUBSTRING(v.data_venda,1,4)) AS data_br,
       c.nome AS cliente, ve.nome AS vendedor, v.valor_total,
       ((v.valor_total * ve.comissao_percentual)/100) AS valor_comissao
FROM venda v
JOIN cliente c ON v.cliente_id = c.id
JOIN vendedor ve ON c.vendedor_id = ve.id
WHERE v.data_venda LIKE '2006%';

-- 5) Listar nome do produto, nome do fornecedor, preço de custo, preço de venda (custo + 25%) e lucro (venda - custo)
-- para produtos cujo fornecedor é do estado de SP e o tipo seja MEDICAMENTOS:

SELECT p.descricao AS produto, f.nome AS fornecedor, p.preco_custo,
       (p.preco_custo * 1.25) AS preco_venda, (p.preco_custo * 0.25) AS lucro
FROM produto p
JOIN fornecedor f ON p.fornecedor_id = f.id
JOIN cidade ci ON f.cidade_id = ci.id
JOIN uf ON ci.uf_id = uf.id
JOIN tipo_produto tp ON p.tipo_produto_id = tp.id
WHERE uf.sigla = 'SP' AND tp.descricao = 'MEDICAMENTOS';

-- 6) Listar a descrição de todos os produtos vendidos para clientes de NOVA FRIBURGO:

SELECT p.descricao AS produto, ci.nome AS cidade
FROM cliente c
JOIN bairro b ON c.bairro_id = b.id
JOIN cidade ci ON b.cidade_id = ci.id
JOIN venda v ON v.cliente_id = c.id
JOIN produto_vendido pv ON pv.venda_id = v.id
JOIN produto p ON pv.produto_id = p.id
WHERE ci.nome = 'NOVA FRIBURGO';

-- 7) Listar todas as vendas creditadas para vendedores cujo nome começa com a letra P:

SELECT v.*, ve.nome
FROM venda v
JOIN cliente c ON v.cliente_id = c.id
JOIN vendedor ve ON c.vendedor_id = ve.id
WHERE ve.nome LIKE 'P%';

-- 8) Listar nome do produto, nome do fornecedor, data da venda, nome do cliente e nome do vendedor
-- para produtos vendidos nos meses 06, 08 e 10:

SELECT p.descricao AS produto, f.nome AS fornecedor, v.data_venda,
       c.nome AS cliente, ve.nome AS vendedor
FROM venda v
JOIN cliente c ON v.cliente_id = c.id
JOIN vendedor ve ON c.vendedor_id = ve.id
JOIN produto_vendido pv ON pv.venda_id = v.id
JOIN produto p ON pv.produto_id = p.id
JOIN fornecedor f ON p.fornecedor_id = f.id
WHERE SUBSTRING(v.data_venda,6,2) IN ('06','08','10');
