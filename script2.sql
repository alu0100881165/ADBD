-- MySQL Script generated by MySQL Workbench
-- mié 13 nov 2019 19:01:08 WET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Familia` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Incompatibilidades` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enfermedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enfermedad` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Síntoma` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FamiliaEnfermedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FamiliaEnfermedad` (
  `Nombre_fam` VARCHAR(45) NOT NULL,
  `Nombre_enf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre_fam`, `Nombre_enf`),
  INDEX `fk_FamiliaEnfermedad_Enf_idx` (`Nombre_enf` ASC),
  CONSTRAINT `fk_FamiliaEnfermedad_Fam`
    FOREIGN KEY (`Nombre_fam`)
    REFERENCES `mydb`.`Familia` (`Nombre`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_FamiliaEnfermedad_Enf`
    FOREIGN KEY (`Nombre_enf`)
    REFERENCES `mydb`.`Enfermedad` (`Nombre`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Laboratio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Laboratio` (
  `Código` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Contacto` VARCHAR(45) NULL,
  `Teléfono` INT NULL,
  `Calle` VARCHAR(45) NULL,
  `NúmCalle` INT NULL,
  `CP` INT NULL,
  PRIMARY KEY (`Código`))
ENGINE = InnoDB
COMMENT = 'El cod del laboratiorio 1 soy yo';


-- -----------------------------------------------------
-- Table `mydb`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicamento` (
  `Código` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Posología` VARCHAR(45) NULL,
  `Igic%` INT NULL,
  `Precio` INT NULL,
  `Tipo` TINYINT(1) NOT NULL,
  `Laboratorio` INT NULL,
  PRIMARY KEY (`Código`),
  INDEX `fk_Medicamento_Labo_idx` (`Laboratorio` ASC),
  CONSTRAINT `fk_Medicamento_Labo`
    FOREIGN KEY (`Laboratorio`)
    REFERENCES `mydb`.`Laboratio` (`Código`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MedicamFamilia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MedicamFamilia` (
  `CódigoMed` INT NOT NULL,
  `NombreFam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CódigoMed`, `NombreFam`),
  INDEX `fk_MedicamFamilia_Fam_idx` (`NombreFam` ASC),
  CONSTRAINT `fk_MedicamFamilia_Medic`
    FOREIGN KEY (`CódigoMed`)
    REFERENCES `mydb`.`Medicamento` (`Código`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_MedicamFamilia_Fam`
    FOREIGN KEY (`NombreFam`)
    REFERENCES `mydb`.`Familia` (`Nombre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `FechaActual` DATETIME NOT NULL,
  `Importe` INT NULL,
  PRIMARY KEY (`FechaActual`))
ENGINE = InnoDB
COMMENT = 'Cada vez que se inserte en CompraMedicamento,  hay que hacer un disparador que actualice en Compra el importe total de la misma.';


-- -----------------------------------------------------
-- Table `mydb`.`MedicamCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MedicamCompra` (
  `CódigoMed` INT NOT NULL,
  `FechaActualCompra` DATETIME NOT NULL,
  `Importe` FLOAT NULL,
  `Igic` FLOAT NULL,
  PRIMARY KEY (`CódigoMed`, `FechaActualCompra`),
  INDEX `fk_MedicamCompra_Fecha_idx` (`FechaActualCompra` ASC),
  CONSTRAINT `fk_MedicamCompra_Cód`
    FOREIGN KEY (`CódigoMed`)
    REFERENCES `mydb`.`Medicamento` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MedicamCompra_Fecha`
    FOREIGN KEY (`FechaActualCompra`)
    REFERENCES `mydb`.`Compra` (`FechaActual`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClienteCred`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ClienteCred` (
  `CC` VARCHAR(30) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `DíaPago` INT NULL,
  PRIMARY KEY (`CC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PagoCréd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PagoCréd` (
  `Mes` INT NOT NULL,
  `Año` INT NOT NULL,
  `FechaActualCompra` DATETIME NOT NULL,
  `FechaPago` DATETIME NULL,
  `CantidadPago` FLOAT NULL,
  `CC` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Mes`, `Año`, `FechaActualCompra`, `CC`),
  INDEX `fk_PagoCréd_Fecha_idx` (`FechaActualCompra` ASC),
  CONSTRAINT `fk_PagoCréd_Fecha`
    FOREIGN KEY (`FechaActualCompra`)
    REFERENCES `mydb`.`Compra` (`FechaActual`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PagoCréd_DNI`
    FOREIGN KEY ()
    REFERENCES `mydb`.`ClienteCred` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb`;

DELIMITER $$
USE `mydb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`MedicamCompra_AFTER_INSERT` AFTER INSERT ON `MedicamCompra` FOR EACH ROW
BEGIN
	/*DECLARE total float;
    SET total = importe * (igic/100)*/
    
    INSERT INTO Compra(FechaActual,Importe) VALUES (FechaActualCompra,(importe * (igic/100)));
    /*SET Importe = importe * (igic/100);*/
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
