-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Shinsekai-db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Shinsekai-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Shinsekai-db` DEFAULT CHARACTER SET utf8 ;
USE `Shinsekai-db` ;

-- -----------------------------------------------------
-- Table `Shinsekai-db`.`subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`subscriptions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `price` FLOAT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `firstName` VARCHAR(25) NULL,
  `lastName` VARCHAR(25) NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `isAdmin` TINYINT NULL DEFAULT 0,
  `subscription_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_subscriptions_idx` (`subscription_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_users_subscriptions`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `Shinsekai-db`.`subscriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`sales` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `imageFilename` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `imageFilename` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `price` FLOAT UNSIGNED NOT NULL,
  `discount` INT UNSIGNED NULL DEFAULT 0,
  `description` TEXT NULL,
  `views` INT UNSIGNED NOT NULL DEFAULT 0,
  `category_id` INT UNSIGNED NULL,
  `sale_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_sales_idx` (`sale_id` ASC) VISIBLE,
  INDEX `fk_products_categories_idx` (`category_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_products_sales`
    FOREIGN KEY (`sale_id`)
    REFERENCES `Shinsekai-db`.`sales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `Shinsekai-db`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`tags` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `imageFilename` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`productImages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`productImages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(255) NOT NULL,
  `product_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_productImages_product_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_productImages_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`productComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`productComments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_productComments_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_productComments_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_productComments_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productComments_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`productReviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`productReviews` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `points` INT NOT NULL DEFAULT 5,
  `content` TEXT NOT NULL,
  `karma` INT NOT NULL DEFAULT 0,
  `user_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_productReviews_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_productReviews_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_productReviews_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productReviews_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`wishLists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`wishLists` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wishLists_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_wishLists_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`viewedHistories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`viewedHistories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_viewedHistories_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_viewedHistories_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`purchasedHistories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`purchasedHistories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchasedHistories_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_purchasedHistories_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`userImages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`userImages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(255) NOT NULL,
  `user_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_userImages_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_userImages_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`linkedAccounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`linkedAccounts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `auth` VARCHAR(255) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_linkedAccounts_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_linkedAccounts_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`purchaseOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`purchaseOrders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchaseOrders_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_purchaseOrders_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`clothesSizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`clothesSizes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`metricSizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`metricSizes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`availableColors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`availableColors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `colorName` VARCHAR(25) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`products_clothesSizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`products_clothesSizes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT UNSIGNED NULL,
  `clothesSize_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_clothesSizes_clothesSizes_idx` (`clothesSize_id` ASC) VISIBLE,
  INDEX `fk_products_clothesSizes_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_products_clothesSizes_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_clothesSizes_clothesSizes`
    FOREIGN KEY (`clothesSize_id`)
    REFERENCES `Shinsekai-db`.`clothesSizes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`products_metricSizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`products_metricSizes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT UNSIGNED NULL,
  `metricSize_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_metricSizes_product_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_products_metricSizes_metricSizes_idx` (`metricSize_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_products_metricSizes_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_metricSizes_metricSizes`
    FOREIGN KEY (`metricSize_id`)
    REFERENCES `Shinsekai-db`.`metricSizes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`products_availableColors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`products_availableColors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT UNSIGNED NULL,
  `availableColor_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_availableColors_products_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_products_availableColors_availableColors_idx` (`availableColor_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_products_availableColors_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_availableColors_availableColors`
    FOREIGN KEY (`availableColor_id`)
    REFERENCES `Shinsekai-db`.`availableColors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`tags_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`tags_products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` INT UNSIGNED NULL,
  `product_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tags_products_tags_idx` (`tag_id` ASC) VISIBLE,
  INDEX `fk_tags_products_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_tags_products_tags`
    FOREIGN KEY (`tag_id`)
    REFERENCES `Shinsekai-db`.`tags` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_products_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`tags_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`tags_users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` INT UNSIGNED NULL,
  `user_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tags_users_tags_idx` (`tag_id` ASC) VISIBLE,
  INDEX `fk_tags_users_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_tags_users_tags`
    FOREIGN KEY (`tag_id`)
    REFERENCES `Shinsekai-db`.`tags` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_users_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Shinsekai-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`wishLists_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`wishLists_products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `wishList_id` INT UNSIGNED NULL,
  `product_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wishLists_products_wishLists_idx` (`wishList_id` ASC) VISIBLE,
  INDEX `fk_wishLists_products_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_wishLists_products_wishLists`
    FOREIGN KEY (`wishList_id`)
    REFERENCES `Shinsekai-db`.`wishLists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wishLists_products_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`viewedHistories_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`viewedHistories_products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `viewedHistory_id` INT UNSIGNED NULL,
  `product_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_viewedHistories_products_viewedHistories_idx` (`viewedHistory_id` ASC) VISIBLE,
  INDEX `fk_viewedHistories_products_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_viewedHistories_products_viewedHistories`
    FOREIGN KEY (`viewedHistory_id`)
    REFERENCES `Shinsekai-db`.`viewedHistories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viewedHistories_products_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`purchaseOrders_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`purchaseOrders_products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchaseOrder_id` INT UNSIGNED NULL,
  `product_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchaseOrders_products_purchaseOrders_idx` (`purchaseOrder_id` ASC) VISIBLE,
  INDEX `fk_purchaseOrders_products_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_purchaseOrders_products_purchaseOrders`
    FOREIGN KEY (`purchaseOrder_id`)
    REFERENCES `Shinsekai-db`.`purchaseOrders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchaseOrders_products_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shinsekai-db`.`purchasedHistories_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shinsekai-db`.`purchasedHistories_products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchasedHistory_id` INT UNSIGNED NULL,
  `product_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchasedHistories_products_purchasedHistories_idx` (`purchasedHistory_id` ASC) VISIBLE,
  INDEX `fk_purchasedHistories_products_products_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_purchasedHistories_products_purchasedHistories`
    FOREIGN KEY (`purchasedHistory_id`)
    REFERENCES `Shinsekai-db`.`purchasedHistories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchasedHistories_products_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shinsekai-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
