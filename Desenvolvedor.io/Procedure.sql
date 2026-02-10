CREATE PROCEDURE PesquisarCategoriaPorId(@id int)
AS
BEGIN
    SELECT * FROM categorias WHERE id=@id
END

EXECUTE dbo.PesquisarCategoriaPorId 1;

CREATE PROCEDURE PersistirDadosEmCategorias(@descricao VARCHAR(255))
AS
BEGIN
    INSERT INTO categorias(descricao, cadastrado_em) VALUES(@descricao, GETDATE())
END

EXEC dbo.PersistirDadosEmCategorias 'Categoria Procedure';

SELECT * FROM categorias;

DROP PROCEDURE PersistirDadosEmCategorias

CREATE PROCEDURE PersistirDadosEmCategorias(@descricao VARCHAR(255))
AS
BEGIN
    IF(@descricao IS NULL)
    BEGIN
        RAISERROR('Descricao não é válida', 16, 1)
        RETURN
    END
    INSERT INTO categorias(descricao, cadastrado_em) VALUES(@descricao, GETDATE())
END

EXEC dbo.PersistirDadosEmCategorias NULL;