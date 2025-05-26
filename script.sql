CREATE DATABASE loja;
GO
USE loja;
GO

CREATE TABLE Produto (
    id INT PRIMARY KEY IDENTITY(1,1),
    descricao VARCHAR(100) NOT NULL,
    precoVenda FLOAT
);
GO

INSERT INTO Produto (descricao, precoVenda) VALUES
('Teclado Gamer', 199.99),
('Mouse Óptico', 89.90),
('Monitor LED 24"', 799.00),
('Notebook i5 10ª Geração', 3599.99);
GO
