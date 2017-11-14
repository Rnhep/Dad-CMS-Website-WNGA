drop database if exists WNGA;
create database  WNGA;
use wnga;

CREATE TABLE IF NOT EXISTS `User` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(30) NOT NULL,
  `LastName` VARCHAR(30) NOT NULL,
  `UserName` VARCHAR(30)NOT NULL,
  `UserPassword` VARCHAR(250) NOT NULL,
  `Enabled` TINYINT NOT NULL,
  PRIMARY KEY (`UserId`),
  KEY `UserName` (`UserName`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Blog_Post` (
  `BlogId` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(50) NULL,
  `Content` LONGTEXT NULL,
  `ImagePath` VARCHAR(255) NULL,
  `PublishDate` DATE NULL,
  `ExpDate` DATE NULL,
  `UserId` INT NOT NULL,
  `CategoryId` INT NOT NULL,
  `StatusId` INT NOT NULL,
  PRIMARY KEY (`BlogId`),
    FOREIGN KEY (`UserId`)
    REFERENCES `User` (`UserId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `New_Feed` (
`NewsFeedId` INT NOT NULL AUTO_INCREMENT,
`Content` VARCHAR(250) NULL,
PRIMARY KEY (`NewsFeedId`)
)ENGINE = InnoDB;

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Authorities` (
  `Username` VARCHAR(30) NOT NULL,
  `Authority` VARCHAR(30) NOT NULL,
    FOREIGN KEY (`Username`)
    REFERENCES `User` (`Username`),
    KEY `Username` (`Username`))
ENGINE = InnoDB;

