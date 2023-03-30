-- Criação dos Schemas STAGE e DATAWAREHOUSE

CREATE SCHEMA STAGE_thiago_wilian4;
GO

CREATE SCHEMA DW_thiago_wilian4;
GO


----------------------------------------------------------------------------

-- Criação da tabela STAGE_museus

CREATE TABLE [STAGE_thiago_wilian4].[STAGE_museus](
    Id INT PRIMARY KEY NOT NULL,
    Nome VARCHAR(MAX) NOT NULL,
    Desc_curta VARCHAR(MAX) NOT NULL,
    Regiao VARCHAR(20) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    Municipio VARCHAR(100) NOT NULL,
    Endereco VARCHAR(MAX) NOT NULL,
    Horario VARCHAR(MAX) NOT NULL,
    Ingresso_cobrado VARCHAR(40) NOT NULL,
    Sites VARCHAR(MAX) NOT NULL,
    Telefone_pub VARCHAR(MAX) NOT NULL,
    Email_pub VARCHAR(MAX) NOT NULL,
    Acessibilidade VARCHAR(20) NOT NULL,
    Acess_fisica VARCHAR(MAX) NOT NULL,
    Acess_visual VARCHAR(MAX) NOT NULL,
    Latitude FLOAT NOT NULL,
    Longitude FLOAT NOT NULL
);

----------------------------------------------------------------------------

-- Criação da tabela STAGE_eventos

CREATE TABLE [STAGE_thiago_wilian4].[STAGE_eventos](
    Id INT PRIMARY KEY NOT NULL,
    Id_museu INT NOT NULL,
    Nome_evento VARCHAR(MAX) NOT NULL,
    Curta_desc VARCHAR(MAX) NOT NULL,
    Longa_desc VARCHAR(MAX) NOT NULL,
    Subtitulo VARCHAR(MAX) NOT NULL,
    Preco VARCHAR(MAX) NOT NULL,
    Inicio DATE NOT NULL,
    Fim DATE NOT NULL,
    Hora_inicio VARCHAR(10) NOT NULL,
    Hora_fim VARCHAR(10) NOT NULL,
    Descript VARCHAR(MAX) NOT NULL,
    Class_etaria VARCHAR(30) NOT NULL,
    Frequencia VARCHAR(20) NOT NULL,
    Telefone_pub VARCHAR(MAX) NOT NULL,
    Sites VARCHAR(MAX) NOT NULL,
    Trad_libras VARCHAR(MAX) NOT NULL,
    Desc_sonora VARCHAR(MAX) NOT NULL,
    Obs VARCHAR(MAX) NOT NULL
);



----------------------------------------------------------------------------

-- Criação das tabelas Falto e Dimensão  (MUSEUS)

  
CREATE TABLE [DW_thiago_wilian4].[Fato_museus](
    Id INT PRIMARY KEY NOT NULL,
    Nome VARCHAR(MAX) NOT NULL,
    Desc_curta VARCHAR(MAX) NOT NULL,
    Municipio VARCHAR(100) NOT NULL,
    Endereco VARCHAR(MAX) NOT NULL,
    Horario VARCHAR(MAX) NOT NULL,
    Sites VARCHAR(MAX) NOT NULL,
    Telefone_pub VARCHAR(MAX) NOT NULL,
    Email_pub VARCHAR(MAX) NOT NULL,
    Acess_fisica VARCHAR(MAX) NOT NULL,
    Acess_visual VARCHAR(MAX) NOT NULL,
    Latitude FLOAT NOT NULL,
    Longitude FLOAT NOT NULL
);


CREATE TABLE [DW_thiago_wilian4].[DIM_Regiao](
    Id INT PRIMARY KEY NOT NULL,
    Regiao VARCHAR(20) NOT NULL
);


CREATE TABLE [DW_thiago_wilian4].[DIM_Estado](
    Id INT PRIMARY KEY NOT NULL,
    Estado VARCHAR(2) NOT NULL
);


CREATE TABLE [DW_thiago_wilian4].[DIM_Ingresso_cobrado](
    Id INT PRIMARY KEY NOT NULL,
    Ingresso_cobrado VARCHAR(40) NOT NULL
);


CREATE TABLE [DW_thiago_wilian4].[DIM_Acessibilidade](
    Id INT PRIMARY KEY NOT NULL,
    Acessibilidade VARCHAR(20) NOT NULL
);


----------------------------------------------------------------------------

-- Criação das tabelas Falto e Dimensão  (EVENTOS)

CREATE TABLE [DW_thiago_wilian4].[Fato_eventos](
    Id INT PRIMARY KEY NOT NULL,
    Id_museu INT NOT NULL,
    Nome_evento VARCHAR(MAX) NOT NULL,
    Curta_desc VARCHAR(MAX) NOT NULL,
    Longa_desc VARCHAR(MAX) NOT NULL,
    Subtitulo VARCHAR(MAX) NOT NULL,
    Preco VARCHAR(MAX) NOT NULL,
    Inicio DATE NOT NULL,
    Fim DATE NOT NULL,
    Hora_inicio VARCHAR(10) NOT NULL,
    Hora_fim VARCHAR(10) NOT NULL,
    Descript VARCHAR(MAX) NOT NULL,
    Telefone_pub VARCHAR(MAX) NOT NULL,
    Sites VARCHAR(MAX) NOT NULL,
    Trad_libras VARCHAR(MAX) NOT NULL,
    Desc_sonora VARCHAR(MAX) NOT NULL,
    Obs VARCHAR(MAX) NOT NULL
);


CREATE TABLE [DW_thiago_wilian4].[DIM_Class_etaria](
    Id INT PRIMARY KEY NOT NULL,
    Class_etaria VARCHAR(30) NOT NULL
);


CREATE TABLE [DW_thiago_wilian4].[DIM_Frequencia](
    Id INT PRIMARY KEY NOT NULL,
    Frequencia VARCHAR(20) NOT NULL
);

