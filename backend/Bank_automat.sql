-- MySQL Script generated by MySQL Workbench
-- Wed Apr 17 14:20:30 2024
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `UserID` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `BDate` DATE NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Account` (
  `AccountNumber` INT NOT NULL,
  `Balance` DECIMAL NULL,
  `Type` VARCHAR(45) NULL,
  `Credit limit` INT NULL,
  `UserID` INT NOT NULL,
  PRIMARY KEY (`AccountNumber`, `UserID`),
  INDEX `fk_Account_User1_idx` (`UserID` ASC) VISIBLE,
  CONSTRAINT `fk_Account_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Card` (
  `CardNumber` VARCHAR(20) NOT NULL,
  `Pin` VARCHAR(125) NULL,
  `Type` VARCHAR(45) NULL,
  `UserID` INT NOT NULL,
  PRIMARY KEY (`CardNumber`, `UserID`),
  INDEX `fk_Card_User1_idx` (`UserID` ASC) VISIBLE,
  CONSTRAINT `fk_Card_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Account_has_Card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Account_has_Card` (
  `AccountNumber` INT NOT NULL,
  `CardNumber` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`AccountNumber`, `CardNumber`),
  INDEX `fk_Account_has_Card_Card1_idx` (`CardNumber` ASC) VISIBLE,
  INDEX `fk_Account_has_Card_Account_idx` (`AccountNumber` ASC) VISIBLE,
  CONSTRAINT `fk_Account_has_Card_Account`
    FOREIGN KEY (`AccountNumber`)
    REFERENCES `mydb`.`Account` (`AccountNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_has_Card_Card1`
    FOREIGN KEY (`CardNumber`)
    REFERENCES `mydb`.`Card` (`CardNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transactions` (
  `idTransaction` INT NOT NULL,
  `id_receiver` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `transaction` VARCHAR(45) NULL,
  `amount` DECIMAL NULL,
  `date_time` DATETIME NULL,
  `AccountNumber` INT NOT NULL,
  PRIMARY KEY (`idTransaction`, `AccountNumber`),
  INDEX `fk_Transactions_Account1_idx` (`AccountNumber` ASC) VISIBLE,
  CONSTRAINT `fk_Transactions_Account1`
    FOREIGN KEY (`AccountNumber`)
    REFERENCES `mydb`.`Account` (`AccountNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
