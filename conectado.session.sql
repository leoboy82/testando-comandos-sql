-- Criar o banco de dados
CREATE DATABASE Biblioteca;

-- Usar o banco de dados criado
USE Biblioteca;

-- Criar tabela Autores
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,
    NomeAutor VARCHAR(50),
    Nacionalidade VARCHAR(30)
);

-- Criar tabela Editoras
CREATE TABLE Editoras (
    EditoraID INT PRIMARY KEY,
    NomeEditora VARCHAR(50),
    Localizacao VARCHAR(50)
);

-- Criar tabela Livros
CREATE TABLE Livros (
    LivroID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    AnoPublicacao INT,
    AutorID INT,
    EditoraID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID),
    FOREIGN KEY (EditoraID) REFERENCES Editoras(EditoraID)
);

-- Inserir dados na tabela Autores
INSERT INTO Autores (AutorID, NomeAutor, Nacionalidade)
VALUES (1, 'Machado de Assis', 'Brasileiro'),
       (2, 'Jane Austen', 'Inglesa');

-- Inserir dados na tabela Editoras
INSERT INTO Editoras (EditoraID, NomeEditora, Localizacao)
VALUES (1, 'Companhia das Letras', 'São Paulo'),
       (2, 'Penguin Classics', 'Londres');

-- Inserir dados na tabela Livros
INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, AutorID, EditoraID)
VALUES (1, 'Dom Casmurro', 1899, 1, 1),
       (2, 'Orgulho e Preconceito', 1813, 2, 2);

-- Consulta utilizando INNER JOIN para obter informações sobre livros, autores e editoras
SELECT Livros.Titulo, Autores.NomeAutor, Editoras.NomeEditora
FROM Livros
INNER JOIN Autores ON Livros.AutorID = Autores.AutorID
INNER JOIN Editoras ON Livros.EditoraID = Editoras.EditoraID;
