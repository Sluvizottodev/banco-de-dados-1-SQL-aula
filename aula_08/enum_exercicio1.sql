USE basevendas;
-- 1)Criar a tabela cidade e preencher com valores contidos nos campos cidade das tabelas clientes e fornecedores
-- além dos campos uf e estado de clientes e fornecedores respectivamente. Afinal, toda cidade pertence a um estado/uf

-- 2)exibir o resultado da nova tabela

-- 3)transformar as tabelas clientes e fornecedores em INNODB

-- 4)Criar o campo cidade_id nas tabelas fornecedores e clientes

-- 5)Juntar fornecedores e cidade pelo nome e pela uf_sigla e estado e fazer o preenchimento de cidade_id

-- Mostrar um join com as tabelas

-- 6)Juntar clientes e cidade pelo nome e pela uf_sigla e uf e fazer o preenchimento de cidade_id

-- Mostrar um JOIN das duas tabelas

-- 7)Não precisamos mais do campo cidade e uf na tabelas clientes. 
-- Não precisamos mais do campo cidade e estado na tabela fornecedores

-- 8 Criar a tabela bairro a partir de clientes. Cada bairro deverá estar vinculado a uma cidade.
-- Lembre-se que várias cidades possuem bairros com o mesmo nome

-- 9) Mostrar a tabela bairro

-- 10) Criar o campo bairro_id em clientes e preencher fazendo um JOIN com a tabela bairro pelos campos nome e cidade_id. 

-- Mostrar um JOINdas duas tabelas

-- 11) Não precisamos mais dos campos bairro e cidade_id em clientes 

-- 12) Nos mesmos moldes, criar a tabela uf a partir de seu vínculo com cidade (uf_sigla). 
-- Cada cidade pertence a uma UF.

-- 13) Mostre todas as UFs

-- 14) Crie o campo uf_id em cidade e preencha de acordo com uf_sigla

-- Mostre a junção das tabelas cidade e UF

-- 15) Não precisamos mais do campo uf_sigla em cidade;

-- 16) Buscar inconsistências em clientes e fornecedores