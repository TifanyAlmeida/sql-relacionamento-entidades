/*DATABASE*/
CREATE DATABASE Confeitaria;
USE Confeitaria;

/*TABELA INGREDIENTE*/
CREATE TABLE Ingrediente(idIngrediente INT not null auto_increment, NomeIngrediente VARCHAR(45), MarcaIngrediente VARCHAR(45),
DtFabricacaoIngrediente VARCHAR(45), DtVencimentoIngrediente VARCHAR(45), primary key(idIngrediente));

/*TABELA PRODUTO*/
CREATE TABLE Produto(idProduto INT not null auto_increment, NomeProduto VARCHAR(45), PesoProduto VARCHAR(45), PrecoProduto VARCHAR(45), DtFabricacaoProduto DATE, DtVencimentoProduto DATE, primary key(idProduto));

/*TABELA RECEITA*/
CREATE TABLE Receita(idProduto INT not null  , idIngrediente INT not null ,peso DECIMAL(5,2), quantidade INT, 
temperatura INT, PRIMARY KEY (idProduto, idIngrediente) ,FOREIGN KEY (idProduto) REFERENCES Produto (idProduto),FOREIGN KEY (idIngrediente) REFERENCES Ingrediente(idIngrediente));

/*INSERT INGREDIENTE*/
INSERT INTO Ingrediente (NomeIngrediente, MarcaIngrediente, DtFabricacaoIngrediente, DtVencimentoIngrediente)  VALUES("Trigo","Dona Benta","2019-02-28","2021-01-03");
INSERT INTO Ingrediente (NomeIngrediente, MarcaIngrediente, DtFabricacaoIngrediente, DtVencimentoIngrediente)  VALUES("Ovo","Avine","2021-03-01","2021-01-03");
INSERT INTO Ingrediente (NomeIngrediente, MarcaIngrediente, DtFabricacaoIngrediente, DtVencimentoIngrediente)  VALUES("Leite","Parmalate","2021-11-12","2021-12-18");
INSERT INTO Ingrediente (NomeIngrediente, MarcaIngrediente, DtFabricacaoIngrediente, DtVencimentoIngrediente)  VALUES("Manteiga","Doriana","2021-02-21","2021-08-29");
INSERT INTO Ingrediente (NomeIngrediente, MarcaIngrediente, DtFabricacaoIngrediente, DtVencimentoIngrediente)  VALUES("Fermento","Porroial","2021-05-05","2021-08-29");

/*INSERT PRODUTO*/
INSERT INTO Produto (NomeProduto, PesoProduto, PrecoProduto, DtFabricacaoProduto, DtVencimentoProduto )  VALUES("Bolo","3kg","R$80,00","2019-02-28","2021-01-03");

/*INSERT RECEITA*/
INSERT INTO Receita (idProduto, idIngrediente,peso, quantidade, temperatura)  VALUES("1","1","3.0","1","160");
INSERT INTO Receita (idProduto, idIngrediente,peso, quantidade, temperatura)  VALUES("1","2","3.0","1","160");
INSERT INTO Receita (idProduto, idIngrediente,peso, quantidade, temperatura)  VALUES("1","3","3.0","1","160");
INSERT INTO Receita (idProduto, idIngrediente,peso, quantidade, temperatura)  VALUES("1","4","3.0","1","160");
INSERT INTO Receita (idProduto, idIngrediente,peso, quantidade, temperatura)  VALUES("1","5","3.0","1","160");

/*SELECT TABELAS*/
SELECT * FROM Ingrediente;
SELECT * FROM Receita;
SELECT * FROM Produto;

/*SELECT NA TABELA RECEITA|BUSCANDO ATRAVÉS DA COLUNA idINGREDIENTE|QUAIS SERÃO AS COLUNAS DA TABELA INGREDIENTE DESSE ID|*/
SELECT Ingrediente.NomeIngrediente,Ingrediente.idIngrediente,Ingrediente.DtVencimentoIngrediente, Receita.quantidade
FROM Receita JOIN Ingrediente ON Receita.idIngrediente = Ingrediente.idIngrediente
WHERE Receita.idIngrediente = 2;

/*SELECT NA TABELA RECEITA|BUSCANDO ATRAVÉS DA COLUNA idPRODUTO|QUAIS SERÃO AS COLUNAS DA TABELA PRODUTO DESSE ID|*/
SELECT Produto.NomeProduto, Produto.PrecoProduto, Produto.DtVencimentoProduto,  Receita.quantidade
FROM Receita JOIN Produto ON Receita.idProduto = Produto.idProduto
WHERE Receita.idProduto = 1;

/*SELECT PARA VER QUAIS OS NOMES DOS INGREDIENTES DE UM BOLO*/
SELECT Produto.idProduto,Produto.NomeProduto,Receita.quantidade,Ingrediente.NomeIngrediente, 
Ingrediente.MarcaIngrediente, Produto.PrecoProduto,
Receita.peso,Receita.temperatura, Produto.DtVencimentoProduto
FROM Receita JOIN Ingrediente ON  Receita.idIngrediente = Ingrediente.idIngrediente
JOIN Produto ON  Receita.idProduto = Produto.idProduto
WHERE Produto.NomeProduto = "Bolo";

/*SELECT PARA VER QUAIS OS NOMES DOS PRODUTOS QUE LEVAM LEITE*/
SELECT Ingrediente.NomeIngrediente, Produto.NomeProduto, 
Ingrediente.MarcaIngrediente, Produto.PrecoProduto,
Produto.DtVencimentoProduto
FROM Receita JOIN Ingrediente ON  Receita.idIngrediente = Ingrediente.idIngrediente
JOIN Produto ON  Receita.idProduto = Produto.idProduto
WHERE Ingrediente.NomeIngrediente = "Leite";

/*DROP TABELAS*/
drop table Receita;
drop table Ingrediente;
drop table Produto;
