---------------------------------
-- CRIAR TABELAS
---------------------------------
CREATE TABLE DEPARTAMENTO (
  Numero	INT,
  Nome		VARCHAR(20) NOT NULL,
  CONSTRAINT PK_DEPTO PRIMARY KEY (Numero),
  CONSTRAINT UK_DEPTO UNIQUE (Nome)
  );

CREATE TABLE PROFESSOR (
  CPF			CHAR(11) NOT NULL,
  Nome			VARCHAR(45) NOT NULL,
  Sexo			CHAR(1),
  Salario		DECIMAL(10,2),
  Departamento	INT DEFAULT 1,
  CONSTRAINT PK_PROF PRIMARY KEY (CPF),
  CONSTRAINT FK_PROF_DEPTO FOREIGN KEY (Departamento) REFERENCES DEPARTAMENTO (Numero)
  );



---------------------------------
-- INSERIR VALORES NAS TABELAS
---------------------------------
INSERT INTO DEPARTAMENTO (Numero, Nome)
VALUES (5,'Vendas'),
(4,'Financeiro'),
(3,'Tecnologia'),
(2,'Comercial'),
(1,'Administrativo')


INSERT INTO PROFESSOR (CPF,Nome,Sexo,Salario,Departamento)  
VALUES ('12345678900','Ricardo Machado','M',1200.00,1),
('12345678901','Manuela Costa','F',2700.00,3),
('21345678900','Carlos A. Martins','M',3200.00,1),
('32145678900','Ana Maria Freitas','F',7500.00,2),
('12345678902','Ricardo Marini','M',5500,1),
('68345618900','Amanda Ramirez', 'F', 6400,4)

SELECT * FROM PROFESSOR
SELECT * FROM DEPARTAMENTO

-- Não vai dar pois o departamento é chave estrangeira de professor
DELETE FROM DEPARTAMENTO WHERE numero = 1

-- Caso 1:	
-- Tirou a chave estrangeira de professor
ALTER TABLE PROFESSOR DROP CONSTRAINT FK_PROF_DEPTO

-- Inserir restrição (Criar a constante novamente + todos que apagam viram dep = 1 (defaut))
ALTER TABLE PROFESSOR 
  ADD CONSTRAINT FK_PROF_DEPTO 
  FOREIGN KEY (Departamento) 
  REFERENCES DEPARTAMENTO (Numero) 
  ON DELETE SET DEFAULT ON UPDATE CASCADE

-- Apaga e altera de acordo com o CASCADE
DELETE FROM DEPARTAMENTO WHERE numero = 3

-- Restaurar dados originais
INSERT INTO DEPARTAMENTO (Numero, Nome)
VALUES (3,'Tecnologia')

UPDATE PROFESSOR
SET Departamento = 3
WHERE CPF = 12345678901

SELECT * FROM PROFESSOR
SELECT * FROM DEPARTAMENTO

-- Caso 2:
ALTER TABLE PROFESSOR DROP CONSTRAINT FK_PROF_DEPTO

-- Inserir restrição (Criar a constante novamente + apaga as tuplas inteiras) 
ALTER TABLE PROFESSOR 
  ADD CONSTRAINT FK_PROF_DEPTO 
  FOREIGN KEY (Departamento) 
  REFERENCES DEPARTAMENTO (Numero) 
  --ON DELETE SET DEFAULT ON UPDATE CASCADE
  ON DELETE CASCADE ON UPDATE CASCADE

SELECT * FROM PROFESSOR
SELECT * FROM DEPARTAMENTO

-- Apaga e altera de acordo com o CASCADE
DELETE FROM DEPARTAMENTO WHERE numero = 1

-- INSERIR REGISTROS NOVAMENTE
INSERT INTO DEPARTAMENTO (Numero, Nome)
VALUES (1,'Administrativo')

-- OBSERVAR QUE COMO EXISTE VALOR DEFAULT=1 PARA DEPARTAMENTO
-- NA TABELA PROFESSOR, NÃO ESTÁ SENDO INSERIDO O NÚMERO DO DEPTO
INSERT INTO PROFESSOR (CPF, Nome, Sexo, Salario)  
VALUES (12345678900,'Ricardo Machado','M',1200.00),
(21345678900,'Carlos A. Martins','M',3200.00)

-- Caso 3:
ALTER TABLE PROFESSOR DROP CONSTRAINT FK_PROF_DEPTO

-- Inserir restrição (Criar a constante novamente, todos que apagam viram dep = nulo) 
ALTER TABLE PROFESSOR 
  ADD CONSTRAINT FK_PROF_DEPTO 
  FOREIGN KEY (Departamento) 
  REFERENCES DEPARTAMENTO (Numero) 
  --ON DELETE SET DEFAULT ON UPDATE CASCADE
  ON DELETE SET NULL ON UPDATE CASCADE

SELECT * FROM PROFESSOR
SELECT * FROM DEPARTAMENTO

-- Apaga e altera de acordo com o CASCADE
DELETE FROM DEPARTAMENTO WHERE numero = 3

-- Restaurar dados originais
INSERT INTO DEPARTAMENTO (Numero, Nome)
VALUES (3,'Tecnologia')

UPDATE PROFESSOR
SET Departamento = 3
WHERE CPF = 12345678901

SELECT * FROM PROFESSOR
SELECT * FROM DEPARTAMENTO