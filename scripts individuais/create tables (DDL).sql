-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema companhiadesegurosautomotivo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema companhiadesegurosautomotivo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `companhiadesegurosautomotivo` DEFAULT CHARACTER SET utf8 ;
USE `companhiadesegurosautomotivo` ;

-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Clientes` (
  `cpf` VARCHAR(14) NOT NULL,
  `rg` VARCHAR(15) NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cepEndereco` VARCHAR(15) NOT NULL,
  `ruaEndereco` TEXT(100) NULL,
  `bairroEndereco` TEXT(50) NOT NULL,
  `numeroEndereco` VARCHAR(10) NULL,
  `cidadeEndereco` TEXT(50) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `cpfClientes` VARCHAR(14) NOT NULL,
  `numero` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `CPF_clientes_idx` (`cpfClientes` ASC) VISIBLE,
  CONSTRAINT `cpf_clientes`
    FOREIGN KEY (`cpfClientes`)
    REFERENCES `companhiadesegurosautomotivo`.`Clientes` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Carro` (
  `idCarro` INT NOT NULL AUTO_INCREMENT,
  `codRenavam` VARCHAR(12) NOT NULL,
  `fabricante` TEXT(100) NOT NULL,
  `modelo` TEXT(50) NOT NULL,
  `ano` INT NOT NULL,
  `cpfClientes` VARCHAR(14) NOT NULL,
  `placa` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCarro`),
  INDEX `CPF_clientes_idx` (`cpfClientes` ASC) VISIBLE,
  CONSTRAINT `cpfClientes`
    FOREIGN KEY (`cpfClientes`)
    REFERENCES `companhiadesegurosautomotivo`.`Clientes` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Ocorrencia` (
  `idOcorrencia` INT NOT NULL AUTO_INCREMENT,
  `descricao` TEXT(500) NOT NULL,
  `bairroLocal` TEXT(50) NOT NULL,
  `cidadeLocal` TEXT(50) NOT NULL,
  `ruaLocal` TEXT(50) NOT NULL,
  `cepLocal` VARCHAR(15) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`idOcorrencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Possui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Possui` (
  `idCarro` INT NOT NULL,
  `idOcorrencia` INT NOT NULL,
  PRIMARY KEY (`idCarro`, `idOcorrencia`),
  INDEX `data_ocorrencia_idx` (`idOcorrencia` ASC) VISIBLE,
  CONSTRAINT `id_carro`
    FOREIGN KEY (`idCarro`)
    REFERENCES `companhiadesegurosautomotivo`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_ocorrencia`
    FOREIGN KEY (`idOcorrencia`)
    REFERENCES `companhiadesegurosautomotivo`.`Ocorrencia` (`idOcorrencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


