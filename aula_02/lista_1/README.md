# 💊 Lista de Exercícios 1.0 – Banco de Dados (Farmácia)

Este repositório contém os scripts SQL da **Lista de Exercícios 1.0**, cujo foco é a criação, alteração e manipulação de uma base de dados para uma farmácia. O objetivo é praticar comandos de DDL (Data Definition Language) e DML (Data Manipulation Language) em SQL.

---

## 📘 Enunciado dos Exercícios

### 1. Criação da Base de Dados
Criar a base de dados `farmacia`, definindo o tipo de caractere e acentuação (collation).

### 2. Criação da Tabela `medicamento`
Criar a tabela com os seguintes campos obrigatórios:
- `id` (chave primária artificial)
- `descricao`
- `preco_de_custo`
- `estoque`
- `fabricante`

❗ Regras:
- Não pode haver combinações repetidas de `descricao` + `fabricante`.
- Utilizar índice único com nomenclatura padrão: `unq_tabela__campo1__campo2`.

### 3. Alterações na Tabela
Adicionar os campos:
- `data_cadastro` (DATE)
- `principio`

### 4. Preenchimento com `now()`
Utilizar a função `now()` para preencher o campo `data_cadastro` nos medicamentos já existentes.

### 5. Renomear Coluna
Alterar a coluna `principio` para `principio_ativo`.

### 6. Inserções de Dados
Inserir os seguintes medicamentos na tabela:

| Descrição         | Preço | Estoque | Fabricante | Data Cadastro | Princípio Ativo        |
|-------------------|-------|---------|------------|----------------|-------------------------|
| SOMALIUM 6MG      | 15.25 | 28      | ACHE       | 10/09/2023     | BROMAZEPAN              |
| NOVALGINA GOTAS   | 12.50 | 50      | HMS        | 15/10/2024     | DIPIRONA                |
| TYLENOL 750MG     | 14.00 | 20      | JANSEN     | `now()`        | PARACETAMOL             |
| CATAFLAN 50MG     | 22.30 | 40      | NOVARTIS   | `now()`        | DICLOFENACO SÓDICO      |
| DORICO 750MG      | 12.99 | 25      | SANOFI     | 25/11/2023     | PARACETAMOL             |
| BINOTAL 500MG     | 48.00 | 15      | BAYER      | `now()`        | AMPICILINA              |
| DELTAREN 50MG     | 20.56 | 40      | DELTA      | `now()`        | DICLOFENACO SÓDICO      |

### 7. Alteração de Nome e Tipo
- Renomear `data_cadastro` para `data_de_cadastro`.
- Tornar esse campo obrigatório (`NOT NULL`).

### 8. Regras no Campo `principio_ativo`
- Tornar o campo obrigatório.
- Adicionar valor default: `'DESCONHECIDO'`.

### 9. Atualização de Dados
- Aumentar em 20% o `preco_de_custo` de todos os medicamentos com `principio_ativo` igual a "PARACETAMOL".

### 10. Consulta com Margem de Lucro
- Exibir os campos: `descricao`, `principio_ativo`, `estoque`, `preco_de_custo`, `preco_de_venda`.
- Considerar uma margem de lucro de 30%.
- Filtrar medicamentos com estoque > 20 e cujo nome começa com A, B, C ou N.

### 11. Nova Coluna
- Adicionar a coluna `margem_de_lucro` com valor default `42.87` e obrigatória.

### 12. Consulta por Preço
- Exibir `descricao`, `preco_de_custo` e `preco_de_venda`.
- Ordenar em ordem decrescente de preço.

### 13. Princípios Ativos Únicos
- Exibir os princípios ativos sem repetição, em ordem alfabética.

### 14. Formatação de Datas
- Exibir `descricao` e `data_de_cadastro` no formato `dd/mm/yyyy` **sem usar funções de data**.

---

## 🧠 Conhecimentos Utilizados

- Criação de banco de dados e tabelas
- Tipos de dados (`DATE`, `VARCHAR`, etc.)
- Restrições (`PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT`)
- Comando `ALTER TABLE`
- Função `NOW()`
- Consultas com `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`
- Atualizações com `UPDATE`
- Inserções com `INSERT INTO`

---

## 📂 Organização dos Arquivos

- `exercicios.sql`: Arquivo principal com todos os comandos da lista.
- `README.md`: Explicação detalhada da atividade e sua estrutura.

---

## 📌 Observação

Esse exercício é ideal para estudantes iniciantes em SQL que queiram praticar **modelagem de dados, integridade de dados e consultas básicas**.

---
