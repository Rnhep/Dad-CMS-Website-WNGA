DROP DATABASE IF EXISTS WNGA_Test;
CREATE DATABASE WNGA_Test;
USE WNGA_Test;

CREATE TABLE IF NOT EXISTS `Status` (
`StatusId` INT NOT NULL AUTO_INCREMENT,
`Status` VARCHAR(45) NOT NULL,
PRIMARY KEY (`StatusId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `User` (
`userId` INT NOT NULL AUTO_INCREMENT,
`FirstName` NVARCHAR(30) NOT NULL,
`LastName` NVARCHAR(30) NOT NULL,
`UserName` NVARCHAR(30)NOT NULL,
`UserPassword` VARCHAR(250) NOT NULL,
`Email` VARCHAR(30)NULL,
`Phone` VARCHAR(30)NULL,
`Enabled` TINYINT NOT NULL,
PRIMARY KEY (`UserId`),
KEY `UserName` (`UserName`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `New_Post` (
`PostId` INT NOT NULL AUTO_INCREMENT,
`Title` VARCHAR(50) NULL,
`Content` NVARCHAR(350) NULL,
`ImagePath` VARCHAR(255) NULL,
`PublishDate` DATE NULL,
`ExpDate` DATE NULL,
`UserId` INT NOT NULL,
PRIMARY KEY (`PostId`),
FOREIGN KEY (`UserId`)
REFERENCES `User` (`UserId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `News_Feed` (
`NewsFeedId` INT NOT NULL AUTO_INCREMENT,
`Content` NVARCHAR(350) NULL,
`Date` DATE NOT NULL,
PRIMARY KEY (`NewsFeedId`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Static_Page` (
`StaticPageId` INT NOT NULL AUTO_INCREMENT,
`Page` VARCHAR(45) NULL,
`Content` NVARCHAR(350)NULL,
`UserId` INT NOT NULL,
PRIMARY KEY (`StaticPageId`),
FOREIGN KEY (`UserId`)
REFERENCES `User` (`UserId`))
ENGINE = InnoDB; 

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Authorities` (
`Username` NVARCHAR(30) NOT NULL,
`Authority` VARCHAR(30) NOT NULL,
FOREIGN KEY (`Username`)
REFERENCES `User` (`Username`),
KEY `Username` (`Username`))
ENGINE = InnoDB;

use wnga_test;
select * from user;
select * from New_Post;
delete from New_Post where PostId = 2;
