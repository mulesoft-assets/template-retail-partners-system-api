CREATE DATABASE IF NOT EXISTS `retail_partners`;

CREATE TABLE IF NOT EXISTS `retail_partners`.`Partner` (
  `partnerId` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `rating` INT NOT NULL,
  `description` VARCHAR(255) NULL,
  `url` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(30) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `shippingPrice` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`partnerId`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `retail_partners`.`Product` (
  `productId` VARCHAR(45) NOT NULL,
  `variantId` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `size` VARCHAR(45) NOT NULL,
  `productPrice` DECIMAL(6,2) NOT NULL,
  `taxPrice` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`productId`, `variantId`))
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `mydb`.`Partner_Product` (
  `Partner_partnerId` VARCHAR(45) NOT NULL,
  `Product_productId` VARCHAR(45) NOT NULL,
  `Product_variantId` VARCHAR(45) NOT NULL,
  `availableCount` INT NOT NULL,
  PRIMARY KEY (`Partner_partnerId`, `Product_productId`, `Product_variantId`),
  INDEX `fk_Partner_has_Product_Product1_idx` (`Product_productId` ASC, `Product_variantId` ASC),
  INDEX `fk_Partner_has_Product_Partner_idx` (`Partner_partnerId` ASC),
  CONSTRAINT `fk_Partner_has_Product_Partner`
    FOREIGN KEY (`Partner_partnerId`)
    REFERENCES `mydb`.`Partner` (`partnerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partner_has_Product_Product1`
    FOREIGN KEY (`Product_productId` , `Product_variantId`)
    REFERENCES `mydb`.`Product` (`productId` , `variantId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB