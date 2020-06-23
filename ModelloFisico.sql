/* Creazione database*/
CREATE SCHEMA IF NOT EXISTS JFLCorporation;
USE JFLCorporation ;

/*Creazione tabella Software*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Software (
  CodiceS INT UNSIGNED NOT NULL AUTO_INCREMENT,
  NomeS VARCHAR(30) NOT NULL,
  DescrizioneVetrinaS VARCHAR(500) NOT NULL,
  ImmagineVetrinaS VARCHAR(100) NOT NULL,
  DataRilascioS date, 
  TitoloDescrizioneSinteticaS VARCHAR (150) NOT NULL,
  DescrizioneSinteticaS VARCHAR(500) NOT NULL,
  ImmagineDescrizioneS VARCHAR(100) NOT NULL,
  SpecificheS VARCHAR (2048) NOT NULL,
  PrezzoS FLOAT NOT NULL,
  
  PRIMARY KEY (CodiceS)
)
ENGINE=InnoDB;

/*Creazione tabella Corso*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Corso (
  CodiceC INT UNSIGNED NOT NULL AUTO_INCREMENT,
  NomeC VARCHAR(500) NOT NULL,
  DescrizioneVetrinaC VARCHAR(500) NOT NULL,
  ImmagineVetrinaC VARCHAR(100) NOT NULL,
  TitoloDescrizioneSinteticaC VARCHAR (150) NOT NULL,
  DescrizioneSinteticaC VARCHAR(500) NOT NULL,
  ImmagineDescrizioneC VARCHAR(100) NOT NULL,
  SpecificheC VARCHAR (2048) NOT NULL,
  NumEsamiC INT NOT NULL,
  
  PRIMARY KEY (CodiceC)
)
ENGINE=InnoDB;