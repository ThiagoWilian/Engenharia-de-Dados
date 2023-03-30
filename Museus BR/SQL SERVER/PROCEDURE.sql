CREATE PROCEDURE [STAGE_thiago_wilian4].[stage_to_dw_thiago_wilian4] AS 
BEGIN

    TRUNCATE TABLE [DW_thiago_wilian4].[Fato_museus]
    TRUNCATE TABLE [DW_thiago_wilian4].[DIM_Regiao]
    TRUNCATE TABLE [DW_thiago_wilian4].[DIM_Estado]
    TRUNCATE TABLE [DW_thiago_wilian4].[DIM_Ingresso_cobrado]
    TRUNCATE TABLE [DW_thiago_wilian4].[DIM_Acessibilidade]

    TRUNCATE TABLE [DW_thiago_wilian4].[Fato_eventos]
    TRUNCATE TABLE [DW_thiago_wilian4].[DIM_Class_etaria]
    TRUNCATE TABLE [DW_thiago_wilian4].[DIM_Frequencia]


    -- FATO_museus
    INSERT INTO [DW_thiago_wilian4].[Fato_museus]
    (Id, Nome, Desc_curta, Municipio, Endereco, Horario, Sites, Telefone_pub, Email_pub, Acess_fisica, Acess_visual, Latitude, Longitude)
    SELECT
        Id, Nome, Desc_curta, Municipio, Endereco, Horario, Sites, Telefone_pub, Email_pub, Acess_fisica, Acess_visual, Latitude, Longitude
    FROM [STAGE_thiago_wilian4].[STAGE_museus] ORDER BY Id

    -- DIM_Regiao
    INSERT INTO [DW_thiago_wilian4].[DIM_Regiao] (Id, Regiao)
    SELECT Id, Regiao
    FROM [STAGE_thiago_wilian4].[STAGE_museus] ORDER BY Id

    -- DIM_Estado
    INSERT INTO [DW_thiago_wilian4].[DIM_Estado] (Id, Estado)
    SELECT Id, Estado
    FROM [STAGE_thiago_wilian4].[STAGE_museus] ORDER BY Id
    
    -- DIM_Ingresso_cobrado
    INSERT INTO [DW_thiago_wilian4].[DIM_Ingresso_cobrado] (Id ,Ingresso_cobrado)
    SELECT Id, Ingresso_cobrado
    FROM [STAGE_thiago_wilian4].[STAGE_museus] ORDER BY Id

    -- DIM_Acessibilidade
    INSERT INTO [DW_thiago_wilian4].[DIM_Acessibilidade] (Id ,Acessibilidade)
    SELECT Id, Acessibilidade
    FROM [STAGE_thiago_wilian4].[STAGE_museus] ORDER BY Id


    -- FATO_eventos
    INSERT INTO [DW_thiago_wilian4].[FATO_eventos]
    (Id, Id_museu, Nome_evento, Curta_desc, Longa_desc, Subtitulo, Preco, Inicio, Fim, 
    Hora_inicio, Hora_fim, Descript, Telefone_pub, Sites, Trad_libras, Desc_sonora, Obs)
    SELECT
        Id, Id_museu, Nome_evento, Curta_desc, Longa_desc, Subtitulo, Preco, Inicio, Fim, 
        Hora_inicio, Hora_fim, Descript, Telefone_pub, Sites, Trad_libras, Desc_sonora, Obs
    FROM [STAGE_thiago_wilian4].[STAGE_eventos] ORDER BY Id

    -- DIM_Class_etaria
    INSERT INTO [DW_thiago_wilian4].[DIM_Class_etaria] (Id, Class_etaria)
    SELECT Id, Class_etaria
    FROM [STAGE_thiago_wilian4].[STAGE_eventos] ORDER BY Id
    
    -- DIM_Frequencia
    INSERT INTO [DW_thiago_wilian4].[DIM_Frequencia] (Id, Frequencia)
    SELECT Id, Frequencia
    FROM [STAGE_thiago_wilian4].[STAGE_eventos] ORDER BY Id


    TRUNCATE TABLE [STAGE_thiago_wilian4].[STAGE_museus]
    TRUNCATE TABLE [STAGE_thiago_wilian4].[STAGE_eventos]


END
;
-- Quando finalizar, salva!!!!!!!!!!!!!!!!!
