-- MySQL Script generated by MySQL Workbench
-- jue 21 nov 2019 12:48:48 WET
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
-- Table `mydb`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proyecto` (
  `Proyecto_id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Fecha_fin` DATE NULL,
  `Dirigido_por` INT NOT NULL,
  PRIMARY KEY (`Proyecto_id`),
  INDEX `fk_Proyecto_Jefe_idx` (`Dirigido_por` ASC),
  CONSTRAINT `fk_Proyecto_Jefe`
    FOREIGN KEY (`Dirigido_por`)
    REFERENCES `mydb`.`Jefe de proyecto` (`Codigo_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jefe de proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jefe de proyecto` (
  `Codigo_id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Telefono` INT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Dirige_proyecto` INT NULL,
  PRIMARY KEY (`Codigo_id`),
  INDEX `fk_Jefe de proyecto_Proyecto_idx` (`Dirige_proyecto` ASC),
  CONSTRAINT `fk_Jefe de proyecto_Proyecto`
    FOREIGN KEY (`Dirige_proyecto`)
    REFERENCES `mydb`.`Proyecto` (`Proyecto_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Figura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Figura` (
  `Figura_id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Área` FLOAT NULL,
  PRIMARY KEY (`Figura_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Planos` (
  `Plano_id` INT NOT NULL,
  `Arquitectos` VARCHAR(45) NULL,
  `Num_figuras` INT NULL,
  `Fecha_entrega` DATE NULL,
  `Dibujo` BLOB NULL,
  `Proyecto_id` INT NULL,
  `FIgura_id` INT NULL,
  PRIMARY KEY (`Plano_id`),
  INDEX `fk_Planos_Proyecto_idx` (`Proyecto_id` ASC),
  INDEX `fk_Planos_Figura_idx` (`FIgura_id` ASC),
  CONSTRAINT `fk_Planos_Proyecto`
    FOREIGN KEY (`Proyecto_id`)
    REFERENCES `mydb`.`Proyecto` (`Proyecto_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Planos_Figura`
    FOREIGN KEY (`FIgura_id`)
    REFERENCES `mydb`.`Figura` (`Figura_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lineas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lineas` (
  `Lineas_id` INT NOT NULL,
  `Origen_x` FLOAT NULL,
  `Origen_y` FLOAT NULL,
  `Fin_x` FLOAT NULL,
  `Fin_y` FLOAT NULL,
  `Longitud` FLOAT NULL,
  `Poligono_id` VARCHAR(45) NULL,
  PRIMARY KEY (`Lineas_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Poligono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Poligono` (
  `Figura_id` INT NOT NULL,
  `Num_lineas` INT NULL,
  `Lineas_id` INT NULL,
  PRIMARY KEY (`Figura_id`),
  INDEX `fk_Poligono_Linea_idx` (`Lineas_id` ASC),
  CONSTRAINT `fk_Poligono_Figura`
    FOREIGN KEY (`Figura_id`)
    REFERENCES `mydb`.`Figura` (`Figura_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Poligono_Linea`
    FOREIGN KEY (`Lineas_id`)
    REFERENCES `mydb`.`Lineas` (`Lineas_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
