-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema meuBanco-v1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema meuBanco-v1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `meuBanco-v1` DEFAULT CHARACTER SET utf8 ;
USE `meuBanco-v1` ;

-- -----------------------------------------------------
-- Table `meuBanco-v1`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meuBanco-v1`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `birth_date` DATE NULL,
  `emailprim` VARCHAR(100) NOT NULL,
  `phone` BIGINT(20) NULL,
  `address` VARCHAR(200) NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `email_prim_UNIQUE` (`emailprim` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meuBanco-v1`.`contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meuBanco-v1`.`contacts` (
  `id_contact` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `telefone` BIGINT(20) NULL,
  `datanasc` DATE NULL,
  `email` VARCHAR(100) NULL,
  `endereco` VARCHAR(200) NULL,
  PRIMARY KEY (`id_contact`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meuBanco-v1`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meuBanco-v1`.`events` (
  `id_event` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` VARCHAR(500) NULL,
  `data` DATE NOT NULL,
  `starting_hour` TIME NOT NULL,
  `ending_hour` TIME NOT NULL,
  `address` VARCHAR(200) NULL,
  `contact_names` VARCHAR(500) NULL,
  PRIMARY KEY (`id_event`),
  CONSTRAINT `fk_events_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `meuBanco-v1`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meuBanco-v1`.`contact_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meuBanco-v1`.`contact_user` (
  `id_user` INT NOT NULL,
  `id_contact` INT NOT NULL,
  INDEX `fk_usuarios_has_contatos_usuarios1_idx` (`id_user` ASC) VISIBLE,
  PRIMARY KEY (`id_user`, `id_contact`),
  INDEX `fk_usuarios_has_contatos_contatos1_idx` (`id_contact` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_contact_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `meuBanco-v1`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_contacts_contacts1`
    FOREIGN KEY (`id_contact`)
    REFERENCES `meuBanco-v1`.`contacts` (`id_contact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
