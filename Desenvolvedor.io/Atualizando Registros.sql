SELECT * FROM alunos;

/*
    UPDATE tabela
    SET campo1 = valor1,
    campo2 = valor2,
    campo3 = campo3 + 'x'
    WHERE filtro
*/

UPDATE alunos
SET data_nascimento = GETDATE(), 
ativo = 1