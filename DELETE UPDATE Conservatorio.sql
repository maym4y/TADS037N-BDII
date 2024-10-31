-- 10 DELETES

SET FOREIGN_KEY_CHECKS = 0;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM musicos WHERE rg = 100123457;

DELETE FROM musicos WHERE nacionalidade = 'Brasileiro';

DELETE FROM orquestras WHERE id = 3;

DELETE FROM instrumentos WHERE categoria = 'Percussão';

DELETE FROM sinfonias WHERE id = 2;

DELETE FROM orquestraMusico WHERE idOrquestra = 4;

DELETE FROM musicoFuncao WHERE idSinfonia = 1;

DELETE FROM orquestras WHERE nome = 'Orquestra Filarmônica%';

DELETE FROM sinfonias WHERE dataCriacao < '1800-01-01';

DELETE FROM orquestraMusico WHERE idOrquestra = 10;

-- 10 UPDATES

UPDATE musicos SET nome = 'Carlos Silva' WHERE rg = 100123467;

UPDATE orquestras SET data_fundacao = '2023-01-01' WHERE id = 2;

UPDATE funcao SET nome = 'Chefe de naipe' WHERE id = 5;

UPDATE musicos SET dataNasc = '1989-11-17' WHERE rg = 100123467;

UPDATE sinfonias SET compositor = 'Ludwig van Beethoven' WHERE nome = 'Sinfonia No. 2';

UPDATE musicoFuncao SET idFuncao = 4 WHERE idMusico = 5 AND idSinfonia = 2;

UPDATE musicos SET nacionalidade = 'Argentino' WHERE rg  = 100123462;

UPDATE orquestras SET cidade = 'São Paulo' WHERE id = 1;

UPDATE orquestras SET nome = 'Nova Orquestra Sinfônica' WHERE id = 1;

UPDATE musicos SET nacionalidade = 'Brasileiro' WHERE rg = 100123461;

SET FOREIGN_KEY_CHECKS = 1;