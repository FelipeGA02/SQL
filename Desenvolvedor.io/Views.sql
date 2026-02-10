SELECT * FROM cursos;
SELECT * FROM categorias;

CREATE VIEW vwCursos
AS
SELECT c.descricao, ca.descricao categoria FROM cursos c 
INNER JOIN categorias ca 
ON c.categoria_id = ca.id

SELECT * FROM vwCursos;
SELECT * FROM vwCursos
WHERE descricao = 'EF Core';

DROP VIEW vwCursos;

CREATE VIEW vwCursos
AS
SELECT c.descricao, ca.descricao categoria FROM cursos c 
INNER JOIN categorias ca 
ON c.categoria_id = ca.id

ALTER VIEW vwCursos
AS
SELECT c.descricao, ca.descricao categoria, c.cadastrado_em FROM cursos c 
INNER JOIN categorias ca 
ON c.categoria_id = ca.id

SELECT * FROM vwCursos;