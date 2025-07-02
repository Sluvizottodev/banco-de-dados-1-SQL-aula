# Comparação entre WHERE e HAVING

Este documento explica as diferenças entre as cláusulas `WHERE` e `HAVING` em SQL, e orienta sobre quando usar cada uma.

---

## 1. O que é `WHERE`?

* **Função**: Filtra linhas **antes** de qualquer agrupamento (`GROUP BY`).
* **Aplicação**: Remove registros da tabela de origem com base em condições que envolvem colunas não agregadas.
* **Sintaxe básica**:

  ```sql
  SELECT coluna1, coluna2
  FROM tabela
  WHERE condição;
  ```
* **Exemplo**:

  ```sql
  SELECT *
  FROM vendas
  WHERE valor > 100;
  ```

  Retorna todas as vendas cujo valor individual é maior que 100.

## 2. O que é `HAVING`?

* **Função**: Filtra grupos **após** a execução do `GROUP BY`.
* **Aplicação**: Remove grupos resultantes do agrupamento com base em condições que podem envolver funções de agregação.
* **Sintaxe básica**:

  ```sql
  SELECT coluna1, SUM(coluna2)
  FROM tabela
  GROUP BY coluna1
  HAVING condição_agregada;
  ```
* **Exemplo**:

  ```sql
  SELECT produto_id, SUM(quantidade) AS total_vendido
  FROM vendas
  GROUP BY produto_id
  HAVING SUM(quantidade) > 100;
  ```

  Retorna apenas os produtos com mais de 100 unidades vendidas no total.

## 3. Diferenças principais

| Característica       | WHERE                             | HAVING                                   |
| -------------------- | --------------------------------- | ---------------------------------------- |
| Momento de filtro    | Antes do agrupamento              | Após o agrupamento                       |
| Uso de agregação     | **Não** permite funções agregadas | **Permite** funções agregadas (SUM, AVG) |
| Cláusula obrigatória | Não depende de `GROUP BY`         | **Depende** de `GROUP BY`                |

## 4. Quando usar cada uma?

* **Use `WHERE`** quando:

  * Precisa filtrar linhas de entrada.
  * As condições envolvem colunas sem agregação.
  * Deseja reduzir o conjunto de dados **antes** de agrupar ou somar.

* **Use `HAVING`** quando:

  * Precisa filtrar **resultados agregados** (grupos).
  * As condições envolvem funções de agregação.
  * Já há um `GROUP BY` na consulta.

## 5. Exemplos combinados

```sql
-- Filtra vendas acima de 50 e, entre estas, mostra produtos com soma de quantidade > 200
SELECT produto_id, SUM(quantidade) AS total_vendido
FROM vendas
WHERE valor_unitario > 50    -- primeiro filtra linhas
GROUP BY produto_id          -- depois agrupa
HAVING SUM(quantidade) > 200; -- por fim filtra grupos
```

---

**Resumo:**

* `WHERE`: filtro **antes** de agrupar, sem agregação.
* `HAVING`: filtro **depois** de agrupar, com agregação.

Use `WHERE` para filtrar linhas e `HAVING` para filtrar grupos.
