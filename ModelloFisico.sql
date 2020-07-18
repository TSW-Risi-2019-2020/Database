/* Creazione database*/
CREATE SCHEMA IF NOT EXISTS JFLCorporation;
USE JFLCorporation ;

/*Creazione tabella Software*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Software (
  CodiceS INT UNSIGNED NOT NULL AUTO_INCREMENT,
  NomeS VARCHAR(30) NOT NULL,
  DescrizioneVetrinaS VARCHAR(500) NOT NULL,
  ImmagineVetrinaS VARCHAR(2048) NOT NULL,
  DataRilascioS date, 
  TitoloDescrizioneSinteticaS VARCHAR (150) NOT NULL,
  DescrizioneSinteticaS VARCHAR(500) NOT NULL,
  ImmagineDescrizioneS VARCHAR(2048) NOT NULL,
  SpecificheS VARCHAR (2048) NOT NULL,
  PrezzoS FLOAT NOT NULL,
  Disponibile bool NOT NULL DEFAULT true,
  
  PRIMARY KEY (CodiceS)
)
ENGINE=InnoDB;

/*Creazione tabella Corso*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Corso (
  CodiceC INT UNSIGNED NOT NULL AUTO_INCREMENT,
  NomeC VARCHAR(500) NOT NULL,
  DescrizioneVetrinaC VARCHAR(500) NOT NULL,
  ImmagineVetrinaC VARCHAR(2048) NOT NULL,
  TitoloDescrizioneSinteticaC VARCHAR (150) NOT NULL,
  DescrizioneSinteticaC VARCHAR(500) NOT NULL,
  ImmagineDescrizioneC VARCHAR(2048) NOT NULL,
  SpecificheC VARCHAR (2048) NOT NULL,
  NumEsamiC INT NOT NULL,
  Disponibile bool NOT NULL DEFAULT true,
  
  PRIMARY KEY (CodiceC)
)
ENGINE=InnoDB;

/*Creazione tabella Cliente*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Cliente (
  Tipo char(1) default "S", 
  UsernameCL VARCHAR(20) NOT NULL,
  NomeCL VARCHAR(50) NOT NULL,
  CognomeCL VARCHAR(50) NOT NULL,
  Data_nascitaCL DATE NOT NULL,
  IndirizzoCL VARCHAR(100) NOT NULL,
  EmailCL VARCHAR(50) NOT NULL,
  PasswordCL CHAR(32) NOT NULL,
  
  CHECK(UsernameCL != "null" AND EmailCL != "null"),
  PRIMARY KEY (EmailCL)
)
ENGINE = InnoDB;

/*Creazione tabella Pagamento*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Pagamento (
	NumCarta CHAR(16) NOT NULL,
    DataScadenza  CHAR(5) NOT NULL,
	Cliente_EmailCL VARCHAR(50) NOT NULL,
	CVC CHAR(32) NOT NULL,

	PRIMARY KEY (NumCarta, Cliente_EmailCL),
    FOREIGN KEY (Cliente_EmailCL)
    REFERENCES JFLCorporation.Cliente (EmailCL)
    
    ON DELETE CASCADE
)
ENGINE = InnoDB;

/*Creazione tabella Acquista*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Acquista(
	Cliente_EmailCL VARCHAR(50) NOT NULL,
	Software_CodiceS INT UNSIGNED NOT NULL,
    Data_acquisto DATE NOT NULL,
    
    PRIMARY KEY(Cliente_EmailCL,Software_CodiceS),
	FOREIGN KEY (Cliente_EmailCL)
    REFERENCES JFLCorporation.Cliente (EmailCL),
    FOREIGN KEY (Software_CodiceS)
    REFERENCES JFLCorporation.Software (CodiceS)
)
ENGINE = InnoDB;

/*Creazione tabella Segue*/
CREATE TABLE IF NOT EXISTS JFLCorporation.Segue(
	Cliente_EmailCL VARCHAR(50) NOT NULL,
	Corso_CodiceC INT UNSIGNED NOT NULL,
    Numero_esami_conseguiti INT UNSIGNED DEFAULT 0,
    Data_iscrizione DATE NOT NULL,
    
    PRIMARY KEY(Cliente_EmailCL,Corso_CodiceC),
	FOREIGN KEY (Cliente_EmailCL)
    REFERENCES JFLCorporation.Cliente (EmailCL),
    FOREIGN KEY (Corso_CodiceC)
    REFERENCES JFLCorporation.Corso (CodiceC)
)
ENGINE = InnoDB;
