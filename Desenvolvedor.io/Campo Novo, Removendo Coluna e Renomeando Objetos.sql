ALTER TABLE categorias 
ADD Teste VARCHAR(100) DEFAULT 'Teste';

SELECT * FROM categorias;

--ALTER TABLE categorias 
--DROP COLUMN Teste;

ALTER TABLE categorias 
DROP CONSTRAINT DF__categoria__Teste__59063A47;
ALTER TABLE categorias 
DROP COLUMN Teste;

SELECT * FROM categorias;

ALTER TABLE categorias 
ADD Teste VARCHAR(100);

EXECUTE sp_rename 'dbo.categorias.Teste', 'Observacao', 'COLUMN';

SELECT * FROM categorias;

EXECUTE sp_rename 'dbo.TabelaTeste', 'TabelaAlterada';