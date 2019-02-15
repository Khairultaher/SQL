CREATE DATABASE Search_Demo;
GO

USE Search_Demo;
GO

CREATE TABLE Authors (
  id INT NOT NULL,
  first_name NVARCHAR(255) NOT NULL,
  last_name NVARCHAR(255) NOT NULL,
  CONSTRAINT PK_Authors PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Books (
  id INT NOT NULL,
  title NVARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  author_id INT NOT NULL,
  CONSTRAINT PK_Books PRIMARY KEY CLUSTERED (id),
  CONSTRAINT FK_Books_Authors FOREIGN KEY (author_id) REFERENCES Authors (id)
);
GO

INSERT INTO Authors (id, first_name, last_name) VALUES
  (100, 'Stephen', 'King'),
  (200, 'Leo', 'Tolstoy'),
  (300, 'Neil', 'Gaiman');

INSERT INTO Books (id, title, description, author_id) VALUES
  (100, 'It', 'This is a horror book.', 100),
  (200, 'The Monarch of Glen', 'A new book from the author of Coraline.', 300),
  (300, 'Anna Karenina', 'Anna Karenina became the basis of the musical "The King and I".', 200);

GO
SELECT b.id, b.title, a.first_name, a.last_name
  FROM Books b
  INNER JOIN Authors a ON b.author_id = a.id
  WHERE b.title LIKE '%king%' OR
    b.description LIKE '%king%' OR
    a.first_name LIKE '%king%' OR
    a.last_name LIKE '%king%';
GO
CREATE FULLTEXT CATALOG Book_Search AS DEFAULT;
GO
CREATE FULLTEXT INDEX ON Authors (
  first_name,
  last_name
) KEY INDEX PK_Authors;
GO
CREATE FULLTEXT INDEX ON Books (
  title,
  description
) KEY INDEX PK_Books;
GO
SELECT b.id, b.title, a.first_name, a.last_name
  FROM Books b
  INNER JOIN Authors a ON b.author_id = a.id
  WHERE CONTAINS(a.first_name, 'king') OR
    CONTAINS(a.last_name, 'king') OR
    CONTAINS(b.title, 'king') OR
    CONTAINS(b.description, 'king');