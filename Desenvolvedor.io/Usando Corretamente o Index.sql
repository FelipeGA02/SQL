-- TABLE SCAN
SELECT descricao FROM Tabela_Teste WHERE LEFT(descricao,16)='DESCRICAO 900000';

-- INDEX SCAN
SELECT descricao FROM Tabela_Teste WHERE descricao LIKE 'DESCRICAO 900000%';