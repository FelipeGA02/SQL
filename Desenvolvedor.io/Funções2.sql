CREATE FUNCTION Mascarar(@data VARCHAR(255), @quantidadeCaracteres int)
RETURNS VARCHAR(255)
AS
BEGIN
    RETURN LEFT(@data, @quantidadeCaracteres)+'**** ****'
END

CREATE FUNCTION ContarRegistros()
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM categorias)
END

CREATE FUNCTION GetCategoriaById(@id int)
RETURNS TABLE
AS
RETURN (SELECT * FROM categorias WHERE id=@id)

SELECT * FROM dbo.GetCategoriaById(2);
SELECT dbo.ContarRegistros();
SELECT dbo.Mascarar(descricao, 4) FROM categorias;