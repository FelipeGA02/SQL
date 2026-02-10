SELECT prod.descricao,  i.produto_id, SUM(i.quantidade) total 
FROM pedido_itens i
INNER JOIN pedidos p ON i.pedido_id = p.id
INNER JOIN produtos prod ON prod.id = i.produto_id
GROUP BY prod.descricao, i.produto_id
ORDER BY i.produto_id
GO

WITH Consulta (codigo, quantidade) AS (
	SELECT i.produto_id, SUM(i.quantidade) total 
	FROM pedido_itens i
	INNER JOIN pedidos p ON i.pedido_id = p.id
	GROUP BY i.produto_id
)
SELECT prod.descricao, c.codigo, c.quantidade FROM Consulta c
INNER JOIN produtos prod ON prod.id = c.codigo
ORDER BY c.codigo