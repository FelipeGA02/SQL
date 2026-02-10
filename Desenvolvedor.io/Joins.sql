SELECT * FROM categorias;
SELECT * FROM cursos;

-- INNER JOIN
SELECT * FROM cursos cr INNER JOIN categorias ca ON ca.id = cr.categoria_id;
SELECT cr.descricao Curso, ca.descricao Categoria FROM cursos cr INNER JOIN categorias ca ON ca.id = cr.categoria_id;

-- LEFT JOIN
INSERT INTO categorias(descricao) VALUES('Categoria Test');
SELECT cr.descricao Curso, ca.descricao Categoria FROM cursos cr INNER JOIN categorias ca ON ca.id = cr.categoria_id;
SELECT cr.descricao Categoria, ca.descricao Curso FROM categorias cr LEFT JOIN cursos ca ON cr.id = ca.categoria_id;

-- RIGHT JOIN
SELECT cr.descricao Curso, ca.descricao Categoria FROM cursos cr INNER JOIN categorias ca ON ca.id = cr.categoria_id;
SELECT cr.descricao Curso, ca.descricao Categoria FROM cursos cr RIGHT JOIN categorias ca ON ca.id = cr.categoria_id;

-- FULL JOIN
SELECT cr.descricao Curso, ca.descricao Categoria FROM cursos cr FULL JOIN categorias ca ON ca.id = (cr.categoria_id+4);

-- UNION/UNION ALL
SELECT descricao FROM cursos WHERE id =1
UNION 
SELECT descricao FROM categorias WHERE id =2
UNION
SELECT 'Valor dinamico'
UNION
SELECT 'Valor dinamico';

SELECT descricao FROM cursos WHERE id =1
UNION ALL
SELECT descricao FROM categorias WHERE id =2
UNION ALL
SELECT 'Valor dinamico'
UNION ALL
SELECT 'Valor dinamico';