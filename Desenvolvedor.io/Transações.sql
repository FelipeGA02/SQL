SELECT * FROM categorias;

BEGIN TRANSACTION
UPDATE categorias SET descricao = UPPER(descricao)
WHERE id > 0
GO
DELETE categorias WHERE id = 4
GO

COMMIT

ROLLBACK

BEGIN TRANSACTION
INSERT INTO categorias(descricao, cadastrado_em) VALUES ('Categoria Nova 1', GETDATE());
INSERT INTO categorias(descricao, cadastrado_em) VALUES ('Categoria Nova 1', GETDATE());
GO
SAVE TRANSACTION AtualizacaoPoint
UPDATE categorias SET descricao='Aplicacao WEB'
WHERE descricao='WEB'
GO

ROLLBACK TRANSACTION AtualizacaoPoint
COMMIT