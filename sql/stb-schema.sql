SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `stb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `stb` ;

-- -----------------------------------------------------
-- Table `stb`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stb`.`request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `justification` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stb`.`tickettype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stb`.`tickettype` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stb`.`leg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stb`.`leg` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `request_id` INT NOT NULL,
  `departure` VARCHAR(45) NULL,
  `destination` VARCHAR(45) NULL,
  `departure_time` DATETIME NULL,
  `destination_time` DATETIME NULL,
  `flight_number` VARCHAR(45) NULL,
  `tickettype_id` INT NULL,
  `notes` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_leg_1_idx` (`request_id` ASC),
  INDEX `fk_leg_2_idx` (`tickettype_id` ASC),
  CONSTRAINT `fk_leg_1`
    FOREIGN KEY (`request_id`)
    REFERENCES `stb`.`request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_leg_2`
    FOREIGN KEY (`tickettype_id`)
    REFERENCES `stb`.`tickettype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stb`.`accommodation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stb`.`accommodation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `arrival` DATE NULL,
  `departure` DATE NULL,
  `notes` TEXT NULL,
  `request_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_accommodation_1_idx` (`request_id` ASC),
  CONSTRAINT `fk_accommodation_1`
    FOREIGN KEY (`request_id`)
    REFERENCES `stb`.`request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stb`.`approval`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stb`.`approval` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `approved` SMALLINT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL,
  `request_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_approval_1_idx` (`user_id` ASC),
  INDEX `fk_approval_2_idx` (`request_id` ASC),
  CONSTRAINT `fk_approval_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `stb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_approval_2`
    FOREIGN KEY (`request_id`)
    REFERENCES `stb`.`request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stb`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stb`.`member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `leg_id` INT NULL,
  `main` SMALLINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_member_1_idx` (`user_id` ASC),
  INDEX `fk_member_2_idx` (`leg_id` ASC),
  CONSTRAINT `fk_member_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `stb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_2`
    FOREIGN KEY (`leg_id`)
    REFERENCES `stb`.`leg` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

