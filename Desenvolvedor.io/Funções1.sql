SELECT descricao FROM categorias;

SELECT LEFT(descricao,4) FROM categorias;
SELECT RIGHT(descricao,4) FROM categorias;

SELECT SUBSTRING(descricao, 2, 5), descricao FROM categorias;

SELECT 'FELIPE' + ' GURGEL';
SELECT 'FELIPE' + ' GURGEL' + NULL;

SELECT CONCAT('FELIPE', ' GURGEL');
SELECT CONCAT(descricao, ' TESTE') FROM categorias;

SELECT ISNULL(null, 'DEFAULT');
SELECT ISNULL(descricao, 'SEM DESCRICAO') FROM categorias;

SELECT COALESCE(null, null, null, 'PRIMEIRO', 'SEGUNDO');
SELECT 1/NULL;
SELECT 2* COALESCE(NULL, 1);

SELECT IIF(1 > 0, 'MAIOR QUE ZERO', 'MENOR QUE ZERO');
SELECT IIF(LEN(descricao) > 5, 'MAIOR QUE CINCO', 'MENOR QUE CINCO'), descricao FROM categorias;

SELECT CAST(GETDATE() AS DATE), CAST (GETDATE() AS TIME);