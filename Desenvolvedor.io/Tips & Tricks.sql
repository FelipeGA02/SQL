-- USANDO O NOLOCK
SELECT * FROM categorias;

BEGIN TRANSACTION
UPDATE categorias SET descricao='Teste com NOLOCK' WHERE id=7

SELECT * FROM categorias;

ROLLBACK

