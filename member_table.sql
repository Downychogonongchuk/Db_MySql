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
-- -----------------------------------------------------
-- Schema db_dbclass
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_dbclass
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_dbclass` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book` (
  `id` BIGINT NULL DEFAULT NULL AUTO_INCREMENT,
  `b_bookname` VARCHAR(20) NULL DEFAULT NULL,
  `b_publisher` VARCHAR(10) NULL DEFAULT NULL,
  `b_price` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `id` BIGINT NULL DEFAULT NULL AUTO_INCREMENT,
  `c_name` VARCHAR(5) NULL DEFAULT NULL,
  `c_address` VARCHAR(10) NULL DEFAULT NULL,
  `c_phone` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` BIGINT NULL DEFAULT NULL AUTO_INCREMENT,
  `customer_id` BIGINT NULL DEFAULT NULL,
  `book_id` BIGINT NULL DEFAULT NULL,
  `o_saleprice` INT NULL DEFAULT NULL,
  `o_orderdate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_id` (`customer_id` ASC) VISIBLE,
  INDEX `fk_book_id` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`id`),
  CONSTRAINT `fk_book_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`book` (`id`));

USE `db_dbclass` ;

-- -----------------------------------------------------
-- Table `db_dbclass`.`member_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_dbclass`.`member_table` (
  `id` BIGINT NOT NULL DEFAULT Auto Increment,
  `member_email` VARCHAR(30) NOT NULL,
  `member_name` VARCHAR(20) NOT NULL,
  `member_password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_dbclass`.`comment_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_dbclass`.`comment_table` (
  `id` INT NOT NULL DEFAULT Auto Increment,
  `comment_writer` VARCHAR(45) NOT NULL,
  `comment_contents` VARCHAR(45) NOT NULL,
  `comment_created` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_dbclass`.`good_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_dbclass`.`good_table` (
  `id` BIGINT NOT NULL DEFAULT Auto Increment,
  `member_table_id` BIGINT NULL,
  `comment_table_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_good_table_member_table_idx` (`member_table_id` ASC) VISIBLE,
  INDEX `fk_good_table_comment_table1_idx` (`comment_table_id` ASC) VISIBLE,
  CONSTRAINT `fk_good_table_member_table`
    FOREIGN KEY (`member_table_id`)
    REFERENCES `db_dbclass`.`member_table` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_good_table_comment_table1`
    FOREIGN KEY (`comment_table_id`)
    REFERENCES `db_dbclass`.`comment_table` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_dbclass`.`category_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_dbclass`.`category_table` (
  `id` BIGINT NOT NULL DEFAULT Auto Increment,
  `category_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_dbclass`.`board_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_dbclass`.`board_table` (
  `id` BIGINT NOT NULL DEFAULT Auto Increment,
  `board_title` VARCHAR(50) NOT NULL,
  `board_writer` VARCHAR(30) NOT NULL,
  `board_contents` VARCHAR(500) NULL,
  `board_hits` INT NULL,
  `board_created_at` DATETIME NULL,
  `board_update_at` DATETIME NULL,
  `board_file_attached` INT NULL,
  `member_table_id` BIGINT NULL,
  `category_table_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_table_member_table1_idx` (`member_table_id` ASC) VISIBLE,
  INDEX `fk_board_table_category_table1_idx` (`category_table_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_table_member_table1`
    FOREIGN KEY (`member_table_id`)
    REFERENCES `db_dbclass`.`member_table` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_table_category_table1`
    FOREIGN KEY (`category_table_id`)
    REFERENCES `db_dbclass`.`category_table` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_dbclass`.`board_file_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_dbclass`.`board_file_table` (
  `id` BIGINT NOT NULL DEFAULT Auto Increment,
  `original_file_name` VARCHAR(100) NULL,
  `stored_file_name` VARCHAR(100) NULL,
  `board_table_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_file_table_board_table1_idx` (`board_table_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_file_table_board_table1`
    FOREIGN KEY (`board_table_id`)
    REFERENCES `db_dbclass`.`board_table` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
