use DesenvolvedorIO;

CREATE TABLE produtos
(
	id int identity primary key,
	descricao varchar(100)
)
GO

CREATE TABLE pedidos
(
	id int identity primary key,
	data DATE,
	observacao VARCHAR(100)
)
GO


CREATE TABLE pedido_itens
(
	id int identity primary key,
	pedido_id INT,
	produto_id INT,
	quantidade INT,
	valor DECIMAL(12, 2),
	FOREIGN KEY(pedido_id) REFERENCES pedidos(id),
	FOREIGN KEY(produto_id) REFERENCES produtos(id),
)
GO


DECLARE @produtos INT = 1 
WHILE @produtos <= 50
BEGIN  
  INSERT INTO produtos(descricao)  VALUES ('PRODUTO '+cast(@produtos as varchar));
  SET @produtos = @produtos+1
END 

DECLARE @pedidos INT = 1 
DECLARE @itens INT = 1 
WHILE @pedidos <= 1000
BEGIN  
  INSERT INTO pedidos(data, observacao)  VALUES (GETDATE(), 'OBSERVACAO '+cast(@pedidos as varchar));
  WHILE @itens <= 50
  BEGIN
	INSERT INTO pedido_itens(pedido_id,produto_id,quantidade,valor)
	VALUES  (@pedidos, @itens, 1, 1);
	SET @itens = @itens + 1;
  END
  SET @itens = 1;
  SET @pedidos = @pedidos+1
END 
GO

CREATE NONCLUSTERED INDEX idx_pedido_itens_pedido_id
ON  pedido_itens (pedido_id)
INCLUDE (produto_id,quantidade)
GO