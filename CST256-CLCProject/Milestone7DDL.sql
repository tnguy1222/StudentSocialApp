-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cst256-clcproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cst256-clcproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cst256-clcproject` DEFAULT CHARACTER SET latin1 ;
USE `cst256-clcproject` ;

-- -----------------------------------------------------
-- Table `cst256-clcproject`.`AFFINITY_GROUP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cst256-clcproject`.`AFFINITY_GROUP` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(256) NULL DEFAULT NULL,
  `DESCRIPTION` TEXT NULL DEFAULT NULL,
  `OWNER_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cst256-clcproject`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cst256-clcproject`.`USER` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` VARCHAR(256) CHARACTER SET 'latin1' COLLATE 'latin1_general_cs' NULL DEFAULT NULL,
  `PASSWORD` VARCHAR(256) CHARACTER SET 'latin1' COLLATE 'latin1_general_cs' NULL DEFAULT NULL,
  `FIRSTNAME` VARCHAR(256) NULL DEFAULT NULL,
  `LASTNAME` VARCHAR(256) NULL DEFAULT NULL,
  `EMAIL` VARCHAR(256) NULL DEFAULT NULL,
  `PHONENUMBER` VARCHAR(256) NULL DEFAULT NULL,
  `CITY` VARCHAR(256) NULL DEFAULT NULL,
  `ROLE` VARCHAR(256) NULL DEFAULT NULL,
  `STATUS` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cst256-clcproject`.`EDUCATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cst256-clcproject`.`EDUCATION` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `SCHOOL` VARCHAR(256) NULL DEFAULT NULL,
  `DEGREE` VARCHAR(256) NULL DEFAULT NULL,
  `FIELD` VARCHAR(256) NULL DEFAULT NULL,
  `GRADUATION_YEAR` VARCHAR(45) NULL DEFAULT NULL,
  `USER_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_EDUCATION_User_idx` (`USER_ID` ASC) ,
  CONSTRAINT `fk_EDUCATION_User`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `cst256-clcproject`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cst256-clcproject`.`JOB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cst256-clcproject`.`JOB` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `JOB_TITLE` VARCHAR(256) NULL DEFAULT NULL,
  `CATEGORY` VARCHAR(256) NULL DEFAULT NULL,
  `DESCRIPTION` TEXT NULL DEFAULT NULL,
  `REQUIREMENTS` TEXT NULL DEFAULT NULL,
  `COMPANY` VARCHAR(256) NULL DEFAULT NULL,
  `LOCATION` VARCHAR(256) NULL DEFAULT NULL,
  `SALARY` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 106
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cst256-clcproject`.`JOB_HISTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cst256-clcproject`.`JOB_HISTORY` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `TITLE` VARCHAR(256) NULL DEFAULT NULL,
  `COMPANY` VARCHAR(256) NULL DEFAULT NULL,
  `START_DATE` DATE NULL DEFAULT NULL,
  `END_DATE` DATE NULL DEFAULT NULL,
  `USER_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_JOB_HISTORY_User1_idx` (`USER_ID` ASC) ,
  CONSTRAINT `fk_JOB_HISTORY_User1`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `cst256-clcproject`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cst256-clcproject`.`MEMBER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cst256-clcproject`.`MEMBER` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` INT(11) NOT NULL,
  `AFFINITY_GROUP_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_GROUP_MEMBER_user1_idx` (`USER_ID` ASC) ,
  INDEX `fk_member_affinity_group1_idx` (`AFFINITY_GROUP_ID` ASC) ,
  CONSTRAINT `fk_GROUP_MEMBER_user1`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `cst256-clcproject`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_affinity_group1`
    FOREIGN KEY (`AFFINITY_GROUP_ID`)
    REFERENCES `cst256-clcproject`.`AFFINITY_GROUP` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cst256-clcproject`.`SKILL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cst256-clcproject`.`SKILL` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `SKILL` VARCHAR(256) NULL DEFAULT NULL,
  `USER_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_SKILL_User1_idx` (`USER_ID` ASC) ,
  CONSTRAINT `fk_SKILL_User1`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `cst256-clcproject`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
