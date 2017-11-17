DROP DATABASE IF EXISTS WNGA;
CREATE DATABASE WNGA;
USE WNGA;

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
`StatusId` INT NOT NULL,
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


INSERT INTO `Status`(`Status`)VALUES('Approve');
INSERT INTO `Status`(`Status`)VALUES('Pending');
INSERT INTO `Status`(`Status`)VALUES('Reject');

INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('សុផា', 'Smith', 'Jsmith', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Nic', 'Doe', 'NicDo', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Mike', 'Nic', 'MikeN', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Rithee', 'Smith', 'RSmith', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Mo', 'Jo', 'MoJo', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Dake', 'Doe', 'Jsmith', '123', true);

INSERT INTO `New_Post`(`Title`, `Content`, `PublishDate`, `ExpDate`, `UserId`, `StatusId` )VALUES('Today news', 'someone cry', '2017-1-1', '2017-1-2', 1,1);
INSERT INTO `New_Post`(`Title`, `Content`, `PublishDate`, `ExpDate`, `UserId`, `StatusId` )VALUES('Notice Tuesday', 'Taco Tuesday', '2017-1-1', '2017-1-2', 3,3);
INSERT INTO `New_Post`(`Title`, `Content`, `PublishDate`, `ExpDate`, `UserId`, `StatusId` )VALUES('Sunday Fun day', 'Just not as fun as described', '2017-1-1', '2017-1-2', 2,2);

INSERT INTO `News_Feed`(`Content`, `Date`)VALUES('Something flew accross the sky today', ' 2017-3-5');
INSERT INTO `News_Feed`(`Content`, `Date`)VALUES('World leaders schedual to meet', ' 2017-9-5');
INSERT INTO `News_Feed`(`Content`, `Date`)VALUES('Today it was a good day', ' 2017-8-5');
INSERT INTO `News_Feed`(`Content`, `Date`)VALUES('Noddel and chips day', ' 2017-8-9');
INSERT INTO `News_Feed`(`Content`, `Date`)VALUES('Notice bright star ', ' 2017-7-5');

INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('Jsmith', 'ROLE_ADMIN');
INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('NicDo', 'ROLE_USER');
INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('MikeN', 'ROLE_USER');

INSERT INTO `Static_Page` (`StaticPageId`, `Page`, `Content`, `UserId`) VALUES (1, 'About','Make new page', 1);
INSERT INTO `Static_Page` (`StaticPageId`, `Page`, `Content`, `UserId`) VALUES (2, 'News', 'Make new page1', 1);



use wnga;
select * from User;
select * from Status;
select * from New_Post;
select * from News_Feed;
select * from Authorities;
select * from Static_page;

select np.Title, np.Content, u.UserName from New_Post np
inner join User u on u.userId = np.userId
where u.userId=1;

select np.* from New_Post np
inner join User u on u.userId = np.userId
where u.userId=1;

select np.title, s.Status, u.FirstName from  New_Post np
inner join  Status s on s.StatusId = np.StatusId
inner join User u on u.userId = NP.StatusId
where s.StatusId = 3;

select  sp.page, u.Username from  Static_Page sp
inner join User u on u.UserId = sp.UserId
where  u.UserId = 1;

update User set  UserPassword = 'corndog' where UserId = 1;
select * from User;