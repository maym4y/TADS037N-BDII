ALTER TABLE musicos ADD telefone VARCHAR(15);

ALTER TABLE musicos MODIFY nacionalidade VARCHAR(50);

ALTER TABLE orquestras ADD website VARCHAR(100);

ALTER TABLE orquestras RENAME COLUMN dataCriacao TO data_fundacao;

ALTER TABLE instrumentos ADD descricao TEXT;

ALTER TABLE instrumentos DROP COLUMN descricao;

ALTER TABLE apresentacao ADD localizacao VARCHAR(100);

ALTER TABLE sinfonias ADD estilo VARCHAR(50);

ALTER TABLE sinfonias DROP COLUMN estilo;

ALTER TABLE sinfonias ADD tempo INT;
