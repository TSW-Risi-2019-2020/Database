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

/*Creazione tabella Cliente*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Cliente (
  CodiceFiscaleCL CHAR(16) NOT NULL,
  NomeCL VARCHAR(50) NOT NULL,
  CognomeCL VARCHAR(50) NOT NULL,
  Data_nascitaCL DATE NOT NULL,
  IndirizzoCL VARCHAR(100) NOT NULL,
  EmailCL VARCHAR(50) NOT NULL,
  PasswordCL VARCHAR(50) NOT NULL,
  
  PRIMARY KEY (CodiceFiscaleCL)
)
ENGINE = InnoDB;

/*Creazione tabella Pagamento*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Pagamento (
	NumCarta CHAR(16) NOT NULL,
    DataScadenza  CHAR(5) NOT NULL,
	Cliente_CodiceFiscaleCL CHAR(16) NOT NULL,
	CVC CHAR(3) NOT NULL,
    
	CHECK(DataScadenza='__/__'),
	PRIMARY KEY (NumCarta, Cliente_CodiceFiscaleCL),
    FOREIGN KEY (Cliente_CodiceFiscaleCL)
    REFERENCES JFLCorporation.Cliente (CodiceFiscaleCL)
    
    ON DELETE CASCADE
)
ENGINE = InnoDB;
