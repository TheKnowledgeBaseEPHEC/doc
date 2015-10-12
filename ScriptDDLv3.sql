-- -----------------------------------------------------
-- Table `bdd_simon`.`User`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `bdd_simon`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT ,
  `Nom` VARCHAR(45) NOT NULL ,
  `Prenom` VARCHAR(45) NOT NULL ,
  `AdresseMail` VARCHAR(45) NOT NULL ,
  `ConfirmAdMail` VARCHAR(45) NOT NULL ,
  `Password` VARCHAR(256) NOT NULL ,
  `ConfirmPasswd` VARCHAR(256) NOT NULL ,
  `Tuteur` TINYINT(1) NOT NULL ,
  `Tutoré` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`idUser`)  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Message` (
  `idMessage` INT NOT NULL AUTO_INCREMENT ,
  `User_idUser` INT NOT NULL ,
  `SujetMessage` VARCHAR(45) NOT NULL ,
  `ContenuMessage` VARCHAR(45) NOT NULL ,
  `DateMessage` DATE NOT NULL ,
  PRIMARY KEY (`idMessage`, `User_idUser`)  ,
  INDEX `fk_Message_User1_idx` (`User_idUser` ASC)  ,
  CONSTRAINT `fk_Message_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `bdd_simon`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Activation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Activation` (
  `idActivation` INT NOT NULL AUTO_INCREMENT ,
  `DateActiv` DATE NOT NULL ,
  `ExpActiv` DATE NOT NULL ,
  `User_idUser` INT NOT NULL ,
  PRIMARY KEY (`idActivation`, `User_idUser`)  ,
  INDEX `fk_Activation_User1_idx` (`User_idUser` ASC)  ,
  CONSTRAINT `fk_Activation_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `bdd_simon`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Verification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Verification` (
  `idVerification` INT NOT NULL AUTO_INCREMENT ,
  `Nom` VARCHAR(45) NOT NULL ,
  `Prenom` VARCHAR(45) NOT NULL ,
  `User_idUser` INT NOT NULL ,
  PRIMARY KEY (`idVerification`, `User_idUser`)  ,
  INDEX `fk_Verification_User1_idx` (`User_idUser` ASC)  ,
  CONSTRAINT `fk_Verification_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `bdd_simon`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Tutore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Tutore` (
  `idTutore` INT NOT NULL AUTO_INCREMENT ,
  `Nom` VARCHAR(45) NOT NULL ,
  `Prenom` VARCHAR(45) NOT NULL ,
  `AdMail` VARCHAR(45) NOT NULL ,
  `User_idUser` INT NOT NULL ,
  PRIMARY KEY (`idTutore`, `User_idUser`)  ,
  INDEX `fk_Tutore_User1_idx` (`User_idUser` ASC)  ,
  CONSTRAINT `fk_Tutore_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `bdd_simon`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Sceance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Sceance` (
  `idSceance` INT NOT NULL AUTO_INCREMENT ,
  `idTuteur` INT NOT NULL ,
  `Duree` INT NOT NULL ,
  `Tutore_idTutore` INT NOT NULL ,
  PRIMARY KEY (`idSceance`, `Tutore_idTutore`)  ,
  INDEX `fk_Sceance_Tutore1_idx` (`Tutore_idTutore` ASC)  ,
  CONSTRAINT `fk_Sceance_Tutore1`
    FOREIGN KEY (`Tutore_idTutore`)
    REFERENCES `bdd_simon`.`Tutore` (`idTutore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Tuteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Tuteur` (
  `idTuteur` INT NOT NULL AUTO_INCREMENT ,
  `Nom` VARCHAR(45) NOT NULL ,
  `Prenom` VARCHAR(45) NOT NULL ,
  `AdMail` VARCHAR(45) NOT NULL ,
  `User_idUser` INT NOT NULL ,
  PRIMARY KEY (`idTuteur`, `User_idUser`)  ,
  INDEX `fk_Tuteur_User1_idx` (`User_idUser` ASC)  ,
  CONSTRAINT `fk_Tuteur_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `bdd_simon`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Ecole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Ecole` (
  `idEcole` INT NOT NULL AUTO_INCREMENT ,
  `NomEcole` VARCHAR(45) NOT NULL ,
  `Image` VARCHAR(50) NOT NULL ,
  `AdEmail` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`idEcole`)  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Fac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Fac` (
  `idFac` INT NOT NULL AUTO_INCREMENT ,
  `NomFac` VARCHAR(45) NOT NULL ,
  `Image` VARCHAR(50) NOT NULL ,
  `Ecole_idEcole` INT NOT NULL ,
  PRIMARY KEY (`idFac`, `Ecole_idEcole`)  ,
  INDEX `fk_Fac_Ecole1_idx` (`Ecole_idEcole` ASC)  ,
  CONSTRAINT `fk_Fac_Ecole1`
    FOREIGN KEY (`Ecole_idEcole`)
    REFERENCES `bdd_simon`.`Ecole` (`idEcole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Cours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Cours` (
  `idCours` INT NOT NULL AUTO_INCREMENT ,
  `idTutore` INT NOT NULL ,
  `IntituleCours` VARCHAR(45) NOT NULL ,
  `Tuteur_idTuteur` INT NOT NULL ,
  `Fac_Ecole_idEcole` INT NOT NULL ,
  PRIMARY KEY (`idCours`, `Tuteur_idTuteur`, `Fac_Ecole_idEcole`)  ,
  INDEX `fk_Cours_Tuteur1_idx` (`Tuteur_idTuteur` ASC)  ,
  INDEX `fk_Cours_Fac1_idx` (`Fac_Ecole_idEcole` ASC)  ,
  CONSTRAINT `fk_Cours_Tuteur1`
    FOREIGN KEY (`Tuteur_idTuteur`)
    REFERENCES `bdd_simon`.`Tuteur` (`idTuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cours_Fac1`
    FOREIGN KEY (`Fac_Ecole_idEcole`)
    REFERENCES `bdd_simon`.`Fac` (`Ecole_idEcole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Transaction` (
  `idTransaction` INT NOT NULL AUTO_INCREMENT ,
  `Prix` FLOAT NOT NULL ,
  `Sceance_idSceance` INT NOT NULL ,
  `Sceance_Tutore_idTutore` INT NOT NULL ,
  PRIMARY KEY (`idTransaction`, `Sceance_idSceance`, `Sceance_Tutore_idTutore`)  ,
  INDEX `fk_Transaction_Sceance1_idx` (`Sceance_idSceance` ASC, `Sceance_Tutore_idTutore` ASC)  ,
  CONSTRAINT `fk_Transaction_Sceance1`
    FOREIGN KEY (`Sceance_idSceance` , `Sceance_Tutore_idTutore`)
    REFERENCES `bdd_simon`.`Sceance` (`idSceance` , `Tutore_idTutore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_simon`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_simon`.`Rating` (
  `idRating` INT NOT NULL AUTO_INCREMENT ,
  `Description` VARCHAR(300) NOT NULL ,
  `idTuteur` INT NOT NULL ,
  `idTutore` INT NOT NULL ,
  `Sceance_idSceance` INT NOT NULL ,
  PRIMARY KEY (`idRating`, `Sceance_idSceance`)  ,
  INDEX `fk_Rating_Sceance1_idx` (`Sceance_idSceance` ASC)  ,
  CONSTRAINT `fk_Rating_Sceance1`
    FOREIGN KEY (`Sceance_idSceance`)
    REFERENCES `bdd_simon`.`Sceance` (`idSceance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



