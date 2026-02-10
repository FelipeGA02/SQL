-- DISTINCT
SELECT * FROM alunos;
SELECT cidade, estado FROM alunos;
SELECT DISTINCT cidade, estado FROM alunos;

-- ORDER BY
SELECT * FROM alunos ORDER BY nome ASC;
SELECT * FROM alunos ORDER BY nome DESC;
SELECT * FROM alunos ORDER BY 1 DESC;
SELECT * FROM alunos ORDER BY nome ASC, cpf DESC, estado ASC;

-- TOP/FETCH
SELECT * FROM alunos ORDER BY id;
SELECT TOP 4 * FROM alunos ORDER BY id;
SELECT TOP 10 PERCENT * FROM alunos ORDER BY id;
--SELECT * FROM alunos ORDER BY id LIMIT 100;
SELECT * FROM alunos ORDER BY id OFFSET 2 ROWS;
SELECT * FROM alunos ORDER BY id 
OFFSET 2 ROWS
FETCH FIRST 2 ROWS ONLY;

-- WHERE
SELECT * FROM alunos WHERE nome = 'Rafael';
SELECT * FROM alunos WHERE id >= 3;

-- AND/OR
SELECT * FROM alunos WHERE id >= 3 
AND nome = 'Bruno';
SELECT * FROM alunos WHERE id >= 3 
AND (nome = 'Bruno' OR nome = 'Heloysa');

-- LIKE
SELECT * FROM alunos WHERE nome LIKE 'Rafael';
SELECT * FROM alunos WHERE nome LIKE 'Ra%';
SELECT * FROM alunos WHERE nome LIKE '%o';
SELECT * FROM alunos WHERE nome LIKE '%a%';
SELECT * FROM alunos WHERE nome LIKE 'R%l';

-- MAX/MIN
SELECT * FROM alunos;
SELECT MAX(id) FROM alunos;
SELECT MIN(id) FROM alunos;
SELECT * FROM alunos 
WHERE id = (SELECT MAX(id) FROM alunos);

-- COUNT/SUM
SELECT * FROM cursos;
SELECT COUNT(*), SUM(total_horas), SUM(valor) FROM cursos;

-- GROUP BY
SELECT * FROM alunos;
SELECT cidade, estado FROM alunos;
SELECT cidade, estado, COUNT(*) FROM alunos GROUP BY cidade, estado;

-- HAVING
SELECT cidade, estado, COUNT(*) Total FROM alunos 
GROUP BY cidade, estado
HAVING COUNT(*) > 1;

-- OPERADOR IN
SELECT * FROM alunos WHERE id IN (2, 4);
SELECT * FROM alunos WHERE id IN (SELECT id FROM alunos);

-- OPERADOR BETWEEN
SELECT * FROM alunos WHERE id BETWEEN 2 AND 4;