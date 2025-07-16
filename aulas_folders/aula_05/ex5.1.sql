USE basevendas;

#1 - OK
SELECT * FROM fornecedores WHERE telefone LIKE '%_11';

#2 - OK - era pra usar igualdade
SELECT cidade, estado FROM fornecedores WHERE estado LIKE 'SP' OR 'RJ' OR 'MG';

#3 - OK
SELECT * FROM produtos WHERE principio LIKE '______' AND principio LIKE '% %';

#4 -  OK
SELECT * FROM produtos WHERE principio LIKE '%A' AND principio NOT LIKE '% % % %';

#5 - OK
SELECT * FROM clientes WHERE datacadastro LIKE '____-11-__' AND cidade LIKE 'M%';

#6 - OK
SELECT nome, datacadastro FROM clientes WHERE cidade != 'FRIBURGO' AND cidade != 'CORDEIRO';

#7 - OK 
#SELECT DISTINCT cidade, bairro FROM clientes; --> Incompleto
#SELECT DISTINCT CONCAT (cidade, '_', bairro) as cidade_bairro FROM clientes WHERE;

#8 - sem db útil
#SELECT * FROM produtos WHERE margemlucro = 0,05 AND lucro > 30,00;

#9 - OK
SELECT * FROM produtos WHERE estoque LIKE '_%' AND apresentacao LIKE '_%';
