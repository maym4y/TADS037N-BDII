INSERT INTO musicos (rg, nome, nacionalidade, dataNasc) VALUES
(100123456, 'Carlos Santos', 'Brasileiro', '1985-04-15'),
(100123457, 'Sofia Almeida', 'Portuguesa', '1990-07-20'),
(100123458, 'Juan Martínez', 'Espanhola', '1983-12-03'),
(100123459, 'Emma Dubois', 'Francesa', '1992-11-25'),
(100123460, 'Giovanni Rossi', 'Italiana', '1978-02-18'),
(100123461, 'Marta Silva', 'Brasileira', '1987-06-09'),
(100123462, 'Michael Johnson', 'Americana', '1995-09-30'),
(100123463, 'Sophie Müller', 'Alemã', '1993-03-12'),
(100123464, 'Yuki Tanaka', 'Japonesa', '1980-01-05'),
(100123465, 'Liam OConnor', 'Irlandesa', '1988-10-14'),
(100123466, 'Paola Costa', 'Portuguesa', '1991-05-21'),
(100123467, 'Diego González', 'Argentina', '1984-08-19'),
(100123468, 'Lucía Ruiz', 'Mexicana', '1997-07-07'),
(100123469, 'Kim Seo-jin', 'Sul-coreana', '1989-11-17'),
(100123470, 'Aleksei Ivanov', 'Russa', '1982-12-29');

INSERT INTO orquestras (nome, cidade, pais, dataCriacao) VALUES
('Orquestra Sinfônica Brasileira', 'Rio de Janeiro', 'Brasil', '1940-08-12'),
('London Symphony Orchestra', 'Londres', 'Reino Unido', '1904-06-09'),
('Orquestra Filarmônica de Viena', 'Viena', 'Áustria', '1842-03-28'),
('Orquestra Sinfônica de Chicago', 'Chicago', 'Estados Unidos', '1891-10-16'),
('Orquestra Nacional do Porto', 'Porto', 'Portugal', '1987-04-23'),
('Orquestra Filarmônica de Buenos Aires', 'Buenos Aires', 'Argentina', '1946-07-01'),
('Tokyo Philharmonic Orchestra', 'Tóquio', 'Japão', '1911-04-01'),
('Orquestra Nacional da França', 'Paris', 'França', '1934-02-19'),
('Sydney Symphony Orchestra', 'Sydney', 'Austrália', '1932-05-30'),
('Orquestra Sinfônica de Moscou', 'Moscou', 'Rússia', '1951-09-22');

INSERT INTO instrumentos (nomeInstrumento, categoriaInstrumento) VALUES
('Violino', 'Cordas'),
('Violoncelo', 'Cordas'),
('Flauta', 'Sopro'),
('Clarinete', 'Sopro'),
('Trompete', 'Sopro'),
('Trombone', 'Sopro'),
('Tímpano', 'Percussão'),
('Xilofone', 'Percussão'),
('Piano', 'Teclas'),
('Harpa', 'Cordas'),
('Oboé', 'Sopro'),
('Fagote', 'Sopro');

ALTER TABLE sinfonias MODIFY compositor VARCHAR(50);

INSERT INTO sinfonias (nome, compositor, dataCriacao) VALUES
('Sinfonia No. 5', 'Ludwig van Beethoven', '1808-12-22'),
('Sinfonia No. 9', 'Antonín Dvořák', '1893-05-01'),
('Sinfonia No. 40', 'Wolfgang Amadeus Mozart', '1788-07-25'),
('Sinfonia Fantástica', 'Hector Berlioz', '1830-12-05'),
('Sinfonia No. 6', 'Pyotr Ilyich Tchaikovsky', '1893-10-28'),
('Sinfonia No. 3', 'Johannes Brahms', '1883-12-02'),
('Sinfonia No. 2', 'Gustav Mahler', '1894-03-04'),
('Sinfonia No. 7', 'Jean Sibelius', '1924-03-24'),
('Sinfonia No. 5', 'Dmitri Shostakovich', '1937-11-21'),
('Sinfonia No. 1', 'Sergei Prokofiev', '1918-04-18');

INSERT INTO funcao (nome, idInstrumento) VALUES
('Maestro', NULL),
('Violinista', 1),
('Violoncelista', 2),
('Flautista', 3),
('Clarinete', 4),
('Trompetista', 5),
('Trombonista', 6),
('Percussionista', 7),
('Pianista', 9),
('Harpista', 10),
('Oboísta', 11),
('Fagotista', 12),
('Assistente de Maestro', NULL),
('Solista', 1),
('Chefe de naipe', 2);

INSERT INTO apresentacao (idOrquestra, idSinfonia) VALUES
(1, 5),
(3, 7),
(4, 2),
(2, 8),
(5, 1),
(7, 3),
(6, 6),
(8, 4),
(9, 10),
(1, 9),
(10, 7),
(2, 6),
(3, 5),
(4, 3),
(5, 2);

INSERT INTO musicoFuncao (idMusico, idFuncao, idSinfonia) VALUES
(100123456, 5, 3),
(100123457, 7, 8),
(100123458, 12, 6),
(100123459, 3, 2),
(100123460, 15, 10),
(100123463, 1, 9),
(100123468, 8, 4),
(100123464, 11, 5),
(100123470, 4, 7),
(100123468, 6, 1),
(100123460, 10, 10),
(100123466, 9, 9),
(100123470, 2, 7),
(100123463, 13, 1),
(100123466, 14, 10);

INSERT INTO orquestraMusico (idMusico, idOrquestra) VALUES
(100123466, 5),
(100123463, 3),
(100123460, 7),
(100123457, 1),
(100123460, 9),
(100123457, 3),
(100123463, 10),
(100123464, 4),
(100123456, 8),
(100123459, 6),
(100123466, 3),
(100123464, 5),
(100123456, 7),
(100123457, 2),
(100123461, 9);
