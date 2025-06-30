# 📌 Resumo sobre Constraints em SQL (MySQL)

## ✅ O que são Constraints?

Constraints são **restrições de integridade** que garantem que os dados inseridos no banco de dados sejam **válidos, consistentes e confiáveis**. Elas são aplicadas nas colunas das tabelas.

---

## 📋 Tipos de Constraints

|-------------------------------------------------------------------------------------------------------------- |
| Constraint      | Descrição                                                                                   |
|---------------- |-------------------------------------------------------------------------------------------- |
| `PRIMARY KEY`   | Identifica de forma única cada registro na tabela. Não permite valores nulos ou repetidos.  |
| `UNIQUE`        | Garante que os valores da coluna sejam únicos. Permite apenas um valor repetido (NULL).     |
| `NOT NULL`      | Garante que o campo **deve ser preenchido** (não pode ser `NULL`).                          |
| `FOREIGN KEY`   | Garante a integridade entre tabelas, referenciando chaves primárias de outras tabelas.      |
| `CHECK`         | Restringe os valores permitidos com base em uma expressão booleana (ex: `idade >= 18`).     |
| `DEFAULT`       | Define um valor padrão para a coluna, caso nenhum valor seja informado.                     |
|-------------------------------------------------------------------------------------------------------------- |
---

## 🧱 Exemplos de Uso

```sql
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    idade INT CHECK (idade >= 16),
    status VARCHAR(10) DEFAULT 'ativo'
);
