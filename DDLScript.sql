
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Verification`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Verification` (
  `idVerification` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Prenom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVerification`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tuteur`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Tuteur` (
  `idTuteur` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Prenom` VARCHAR(45) NOT NULL,
  `AdMail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTuteur`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tutore`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Tutore` (
  `idTutore` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Prenom` VARCHAR(45) NOT NULL,
  `AdMail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTutore`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Prenom` VARCHAR(45) NOT NULL,
  `AdresseMail` VARCHAR(45) NOT NULL,
  `ConfirmAdMail` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(256) NOT NULL,
  `ConfirmPasswd` VARCHAR(256) NOT NULL,
  `Tuteur` TINYINT(1) NOT NULL,
  `Tutoré` TINYINT(1) NOT NULL,
  `Verification_idVerification` INT NOT NULL,
  `Tuteur_idTuteur` INT NOT NULL,
  `Tutore_idTutore` INT NOT NULL,
  PRIMARY KEY (`idUser`, `Verification_idVerification`, `Tuteur_idTuteur`, `Tutore_idTutore`) ,
  INDEX `fk_User_Verification1_idx` (`Verification_idVerification` ASC) ,
  INDEX `fk_User_Tuteur1_idx` (`Tuteur_idTuteur` ASC) ,
  INDEX `fk_User_Tutore1_idx` (`Tutore_idTutore` ASC) ,
  CONSTRAINT `fk_User_Verification1`
    FOREIGN KEY (`Verification_idVerification`)
    REFERENCES `mydb`.`Verification` (`idVerification`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Tuteur1`
    FOREIGN KEY (`Tuteur_idTuteur`)
    REFERENCES `mydb`.`Tuteur` (`idTuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Tutore1`
    FOREIGN KEY (`Tutore_idTutore`)
    REFERENCES `mydb`.`Tutore` (`idTutore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Message`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Message` (
  `idMessage` INT NOT NULL AUTO_INCREMENT,
  `User_idUser` INT NOT NULL,
  `SujetMessage` VARCHAR(45) NOT NULL,
  `ContenuMessage` VARCHAR(45) NOT NULL,
  `DateMessage` DATE NOT NULL,
  PRIMARY KEY (`idMessage`, `User_idUser`) ,
  INDEX `fk_Message_User1_idx` (`User_idUser` ASC) ,
  CONSTRAINT `fk_Message_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Activation`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Activation` (
  `idActivation` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `DateActiv` DATE NOT NULL,
  `ExpActiv` DATE NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idActivation`, `User_idUser`) ,
  INDEX `fk_Activation_User1_idx` (`User_idUser` ASC) ,
  CONSTRAINT `fk_Activation_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transaction`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Transaction` (
  `idTransaction` INT NOT NULL AUTO_INCREMENT,
  `Prix` FLOAT NOT NULL,
  PRIMARY KEY (`idTransaction`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rating`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Rating` (
  `idRating` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idRating`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sceance`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Sceance` (
  `idSceance` INT NOT NULL AUTO_INCREMENT,
  `idTuteur` INT NOT NULL,
  `idTutore` INT NOT NULL,
  `Duree` INT NOT NULL,
  `Tutore_idTutore` INT NOT NULL,
  `Transaction_idTransaction` INT NOT NULL,
  `Rating_idRating` INT NOT NULL,
  PRIMARY KEY (`idSceance`, `Tutore_idTutore`, `Transaction_idTransaction`, `Rating_idRating`) ,
  INDEX `fk_Sceance_Tutore1_idx` (`Tutore_idTutore` ASC) ,
  INDEX `fk_Sceance_Transaction1_idx` (`Transaction_idTransaction` ASC) ,
  INDEX `fk_Sceance_Rating1_idx` (`Rating_idRating` ASC) ,
  CONSTRAINT `fk_Sceance_Tutore1`
    FOREIGN KEY (`Tutore_idTutore`)
    REFERENCES `mydb`.`Tutore` (`idTutore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sceance_Transaction1`
    FOREIGN KEY (`Transaction_idTransaction`)
    REFERENCES `mydb`.`Transaction` (`idTransaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sceance_Rating1`
    FOREIGN KEY (`Rating_idRating`)
    REFERENCES `mydb`.`Rating` (`idRating`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ecole`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Ecole` (
  `idEcole` INT NOT NULL AUTO_INCREMENT,
  `NomEcole` VARCHAR(45) NOT NULL,
  `Image` VARCHAR(50) NOT NULL,
  `AdEmail` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEcole`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fac`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Fac` (
  `idFac` INT NOT NULL AUTO_INCREMENT,
  `NomFac` VARCHAR(45) NOT NULL,
  `Ecole_idEcole` INT NOT NULL,
  `Image` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idFac`, `Ecole_idEcole`) ,
  INDEX `fk_Fac_Ecole1_idx` (`Ecole_idEcole` ASC) ,
  CONSTRAINT `fk_Fac_Ecole1`
    FOREIGN KEY (`Ecole_idEcole`)
    REFERENCES `mydb`.`Ecole` (`idEcole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cours`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Cours` (
  `idCours` INT NOT NULL AUTO_INCREMENT,
  `IntituleCours` VARCHAR(45) NOT NULL,
  `Tuteur_idTuteur` INT NOT NULL,
  `Sceance_idSceance` INT NOT NULL,
  `Sceance_Tutore_idTutore` INT NOT NULL,
  `Fac_idFac` INT NOT NULL,
  PRIMARY KEY (`idCours`, `Tuteur_idTuteur`, `Sceance_idSceance`, `Sceance_Tutore_idTutore`, `Fac_idFac`) ,
  INDEX `fk_Cours_Tuteur1_idx` (`Tuteur_idTuteur` ASC) ,
  INDEX `fk_Cours_Sceance1_idx` (`Sceance_idSceance` ASC, `Sceance_Tutore_idTutore` ASC) ,
  INDEX `fk_Cours_Fac1_idx` (`Fac_idFac` ASC) ,
  CONSTRAINT `fk_Cours_Tuteur1`
    FOREIGN KEY (`Tuteur_idTuteur`)
    REFERENCES `mydb`.`Tuteur` (`idTuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cours_Sceance1`
    FOREIGN KEY (`Sceance_idSceance` , `Sceance_Tutore_idTutore`)
    REFERENCES `mydb`.`Sceance` (`idSceance` , `Tutore_idTutore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cours_Fac1`
    FOREIGN KEY (`Fac_idFac`)
    REFERENCES `mydb`.`Fac` (`idFac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


