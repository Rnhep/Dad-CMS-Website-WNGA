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
`FirstName` NVARCHAR(50) NOT NULL,
`LastName` NVARCHAR(50) NOT NULL,
`UserName` NVARCHAR(50)NOT NULL,
`UserPassword` VARCHAR(500) NOT NULL,
`Email` VARCHAR(100)NULL,
`Phone` VARCHAR(30)NULL,
`Enabled` TINYINT NOT NULL,
PRIMARY KEY (`UserId`),
KEY `UserName` (`UserName`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `New_Post` (
`PostId` INT NOT NULL AUTO_INCREMENT,
`Title` NVARCHAR(100) NULL,
`Content` NVARCHAR(5000) NULL,
`ImagePath` NVARCHAR(2000) NULL,
`ImagePathTwo` NVARCHAR(2000) NULL,
`PublishDate` DATETIME NULL,
`UserId` INT NOT NULL,
PRIMARY KEY (`PostId`),
FOREIGN KEY (`UserId`)
REFERENCES `User` (`UserId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `News_Feed` (
`NewsFeedId` INT NOT NULL AUTO_INCREMENT,
`Title` NVARCHAR(100),
`Date` DATE NOT NULL,
`Content` NVARCHAR(5000) NULL,
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


-- INSERT INTO `Status`(`Status`)VALUES('Approve');
-- INSERT INTO `Status`(`Status`)VALUES('Pending');
-- INSERT INTO `Status`(`Status`)VALUES('Reject');
-- 
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('សុផា', 'Smith', 'សុផា', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Nic', 'Doe', 'NicDo', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Mike', 'Nic', 'MikeN', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Rithee', 'Smith', 'RSmith', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Mo', 'Jo', 'MoJo', '123', true);
INSERT INTO `User`(`FirstName`, `LastName`, `UserName`, `UserPassword`, `Enabled` )VALUES('Dake', 'Doe', 'Jsmith', '123', true);
-- 
-- INSERT INTO `New_Post`(`Title`, `Content`, `PublishDate`,  `UserId`)VALUES('Today',' with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu', '2017-1-2', 1);
-- 
-- 
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Something flew accross the sky today', ' 2017-3-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','World leaders schedual to meet', ' 2017-9-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Today it was a good day', ' 2017-8-5');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Noddel and chips day', ' 2017-8-9');
-- INSERT INTO `News_Feed`(`Title`,`Content`, `Date`)VALUES('education','Notice bright star ', ' 2017-7-5');
-- 
-- INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('Jsmith', 'ROLE_ADMIN');
-- INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('NicDo', 'ROLE_USER');
-- INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('MikeN', 'ROLE_USER');
-- 
-- INSERT INTO `Static_Page` (`StaticPageId`, `Page`, `Content`, `UserId`) VALUES (1, 'About','Make new page', 1);
-- INSERT INTO `Static_Page` (`StaticPageId`, `Page`, `Content`, `UserId`) VALUES (2, 'News', 'Make new page1', 1);
-- 
-- 
-- 
-- use wnga;
-- select * from User;
-- select left(Content, 50) from News_Feed where NewsFeedId = 1;
-- select * from Status;
-- select * from New_Post;
-- select * from News_Feed;
-- select * from Authorities;
-- select * from Static_page;
-- 
-- select u.UserName from New_Post np
-- inner join User u on u.userId = np.UserId
-- where np.postId = 2;
-- 
-- select * from New_Post np
-- inner join user u on u.userId = np.UserId
-- where np.postId = 2;
-- 
-- 
-- select np.Title, np.Content, u.UserName from New_Post np
-- inner join User u on u.userId = np.userId
-- where u.userId=1;
-- 
-- select np.* from New_Post np
-- inner join User u on u.userId = np.userId
-- where u.userId=1;
-- 
-- select np.title, s.Status, u.FirstName from  New_Post np
-- inner join  Status s on s.StatusId = np.StatusId
-- inner join User u on u.userId = NP.StatusId
-- where s.StatusId = 3;
-- 
-- select  sp.page, u.Username from  Static_Page sp
-- inner join User u on u.UserId = sp.UserId
-- where  u.UserId = 1;
-- 
-- update User set  UserPassword = 'corndog' where UserId = 1;
-- select * from User;
-- update News_Feed set Title='Paris Peace Agreement' where NewsFeedId= 4;
-- update  News_Feed set Title='Education' where NewsFeedId=1;
-- update  News_Feed set Title='Health' where NewsFeedId=2;
-- update  News_Feed set Title='Human Right' where NewsFeedId=3;
-- delete from News_Feed  where NewsFeedId>=8 limit 10;
-- select count(*)from News_Feed;
-- delete  from New_post where PostId <4;
-- 
-- 
