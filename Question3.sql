-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`GeneMutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GeneMutation` (
  `Gene_ID` INT NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Chromosome` VARCHAR(45) NULL,
  `Position_start` INT NULL,
  `Poistion_stop` INT NULL,
  `Description_gene` VARCHAR(45) NULL,
  PRIMARY KEY (`Gene_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `Syndrome_ID` INT NOT NULL,
  `Syndrome_name` VARCHAR(45) NULL,
  `Syndrome_description` VARCHAR(45) NOT NULL,
  `Gene_ID` INT NOT NULL,
  PRIMARY KEY (`Syndrome_ID`),
  INDEX `fk_Syndrome_1_idx` (`Gene_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Syndrome_1`
    FOREIGN KEY (`Gene_ID`)
    REFERENCES `mydb`.`GeneMutation` (`Gene_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `PatientID` INT NOT NULL,
  `Gender` ENUM('M', 'F') NULL,
  `Age` VARCHAR(45) NULL,
  `Patientname` VARCHAR(45) NULL,
  `Syndrome_ID` INT NOT NULL,
  PRIMARY KEY (`PatientID`),
  INDEX `fk_Patient_2_idx` (`Syndrome_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_2`
    FOREIGN KEY (`Syndrome_ID`)
    REFERENCES `mydb`.`Syndrome` (`Syndrome_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
