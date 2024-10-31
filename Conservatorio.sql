-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Conservatorio
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Conservatorio` ;

-- -----------------------------------------------------
-- Schema Conservatorio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Conservatorio` DEFAULT CHARACTER SET utf8 ;
USE `Conservatorio` ;

-- -----------------------------------------------------
-- Table `Conservatorio`.`Orquestras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`Orquestras` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`Orquestras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `dataCriacao` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idOrquestras_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Conservatorio`.`Sinfonias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`Sinfonias` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`Sinfonias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `compositor` VARCHAR(50) NOT NULL,
  `dataCriacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Conservatorio`.`Musicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`Musicos` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`Musicos` (
  `rg` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `nacionalidade` VARCHAR(20) NOT NULL,
  `dataNasc` DATE NOT NULL,
  PRIMARY KEY (`rg`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Conservatorio`.`Instrumentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`Instrumentos` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`Instrumentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Conservatorio`.`Funcao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`Funcao` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`Funcao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idInstrumento` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `idInstrumento_idx` (`idInstrumento` ASC) VISIBLE,
  CONSTRAINT `idInstrumento`
    FOREIGN KEY (`idInstrumento`)
    REFERENCES `Conservatorio`.`Instrumentos` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Conservatorio`.`orquestraMusico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`orquestraMusico` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`orquestraMusico` (
  `idMusico` INT NOT NULL,
  `idOrquestra` INT NOT NULL,
  PRIMARY KEY (`idMusico`, `idOrquestra`),
  INDEX `idOrquestra_idx` (`idOrquestra` ASC) VISIBLE,
  CONSTRAINT `idOrquestra1`
    FOREIGN KEY (`idOrquestra`)
    REFERENCES `Conservatorio`.`Orquestras` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `idMusico1`
    FOREIGN KEY (`idMusico`)
    REFERENCES `Conservatorio`.`Musicos` (`rg`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Conservatorio`.`musicoFuncao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`musicoFuncao` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`musicoFuncao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idMusico` INT NOT NULL,
  `idFuncao` INT NOT NULL,
  `idSinfonia` INT NOT NULL,
  `data` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `idFuncao_idx` (`idFuncao` ASC) VISIBLE,
  INDEX `idSinfonia_idx` (`idSinfonia` ASC) VISIBLE,
  INDEX `idMusico_idx` (`idMusico` ASC) VISIBLE,
  CONSTRAINT `idFuncao`
    FOREIGN KEY (`idFuncao`)
    REFERENCES `Conservatorio`.`Funcao` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `idSinfonia1`
    FOREIGN KEY (`idSinfonia`)
    REFERENCES `Conservatorio`.`Sinfonias` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `idMusico`
    FOREIGN KEY (`idMusico`)
    REFERENCES `Conservatorio`.`Musicos` (`rg`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Conservatorio`.`apresentacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conservatorio`.`apresentacao` ;

CREATE TABLE IF NOT EXISTS `Conservatorio`.`apresentacao` (
  `idOrquestra` INT NOT NULL,
  `idSinfonia` INT NOT NULL,
  PRIMARY KEY (`idOrquestra`, `idSinfonia`),
  INDEX `idSinfonia_idx` (`idSinfonia` ASC) VISIBLE,
  CONSTRAINT `idOrquestra`
    FOREIGN KEY (`idOrquestra`)
    REFERENCES `Conservatorio`.`Orquestras` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `idSinfonia`
    FOREIGN KEY (`idSinfonia`)
    REFERENCES `Conservatorio`.`Sinfonias` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
