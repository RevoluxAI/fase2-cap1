-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-04-15 20:36:03 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE APLICACAO_RECURSOS CASCADE CONSTRAINTS 
;

DROP TABLE CULTURA CASCADE CONSTRAINTS 
;

DROP TABLE LEITURA_SENSOR CASCADE CONSTRAINTS 
;

DROP TABLE PLANTACAO CASCADE CONSTRAINTS 
;

DROP TABLE PLANTACAO_CULTURA CASCADE CONSTRAINTS 
;

DROP TABLE SENSOR CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE APLICACAO_RECURSOS 
    ( 
     id_aplicacao        INTEGER  NOT NULL , 
     id_plantacao        INTEGER  NOT NULL , 
     data_hora_aplicacao DATE  NOT NULL , 
     tipo_recurso        VARCHAR2 (50)  NOT NULL , 
     quantidade          NUMBER  NOT NULL 
    ) 
;

COMMENT ON COLUMN APLICACAO_RECURSOS.tipo_recurso IS 'Água, Fósforo, Potássio, etc.' 
;

COMMENT ON COLUMN APLICACAO_RECURSOS.quantidade IS 'litros, kg, etc' 
;

ALTER TABLE APLICACAO_RECURSOS 
    ADD CONSTRAINT PK_APLICACAO_RECURSOS PRIMARY KEY ( id_aplicacao ) ;

CREATE TABLE CULTURA 
    ( 
     id_cultura   INTEGER  NOT NULL , 
     nome_cultura VARCHAR2 (100)  NOT NULL , 
     tipo_cultura VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE CULTURA 
    ADD CONSTRAINT PK_CULTURA PRIMARY KEY ( id_cultura ) ;

CREATE TABLE LEITURA_SENSOR 
    ( 
     id_leitura   INTEGER  NOT NULL , 
     id_sensor    INTEGER  NOT NULL , 
     id_plantacao INTEGER  NOT NULL , 
     valor_lido   NUMBER  NOT NULL 
    ) 
;

ALTER TABLE LEITURA_SENSOR 
    ADD CONSTRAINT PK_LEITURA_SENSOR PRIMARY KEY ( id_leitura ) ;

CREATE TABLE PLANTACAO 
    ( 
     id_plantacao   INTEGER  NOT NULL , 
     nome_plantacao VARCHAR2 (50)  NOT NULL , 
     area_m2        NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PLANTACAO 
    ADD CONSTRAINT PK_PLANTACAO PRIMARY KEY ( id_plantacao ) ;

CREATE TABLE PLANTACAO_CULTURA 
    ( 
     id_plantacao_cultura INTEGER  NOT NULL , 
     id_plantacao         INTEGER  NOT NULL , 
     id_cultura           INTEGER  NOT NULL , 
     data_inicio          DATE  NOT NULL , 
     data_final           DATE  NOT NULL 
    ) 
;

ALTER TABLE PLANTACAO_CULTURA 
    ADD CONSTRAINT PK_Plantacao_Cultura PRIMARY KEY ( id_plantacao_cultura ) ;

CREATE TABLE SENSOR 
    ( 
     id_sensor      INTEGER  NOT NULL , 
     tipo_sensor    VARCHAR2 (50)  NOT NULL , 
     modelo_sensor  VARCHAR2 (50) , 
     unidade_medida VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE SENSOR 
    ADD CONSTRAINT PK_SENSOR PRIMARY KEY ( id_sensor ) ;

ALTER TABLE APLICACAO_RECURSOS 
    ADD CONSTRAINT FK_APLIC_REC_PLANTACAO FOREIGN KEY 
    ( 
     id_plantacao
    ) 
    REFERENCES PLANTACAO 
    ( 
     id_plantacao
    ) 
;

ALTER TABLE LEITURA_SENSOR 
    ADD CONSTRAINT FK_LEITURA_SENS_PLANTACAO FOREIGN KEY 
    ( 
     id_plantacao
    ) 
    REFERENCES PLANTACAO 
    ( 
     id_plantacao
    ) 
;

ALTER TABLE LEITURA_SENSOR 
    ADD CONSTRAINT FK_LEITURA_SENS_SENSOR FOREIGN KEY 
    ( 
     id_sensor
    ) 
    REFERENCES SENSOR 
    ( 
     id_sensor
    ) 
;

ALTER TABLE PLANTACAO_CULTURA 
    ADD CONSTRAINT FK_PLANT_CULT_CULTURA FOREIGN KEY 
    ( 
     id_cultura
    ) 
    REFERENCES CULTURA 
    ( 
     id_cultura
    ) 
;

ALTER TABLE PLANTACAO_CULTURA 
    ADD CONSTRAINT FK_PLANT_CULT_PLANTACAO FOREIGN KEY 
    ( 
     id_plantacao
    ) 
    REFERENCES PLANTACAO 
    ( 
     id_plantacao
    ) 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
