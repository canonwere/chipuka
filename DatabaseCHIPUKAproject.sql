

CREATE DATABASE CHIPUKAproject;
show databases;
use chipukaproject;
CREATE TABLE `USERS`(
`userId` int(11) not null,
`userName` text not null,
`userEmail` varchar(255) not null,
`userPhoneNumber` varchar(10) not null,
`userPassword` varchar(255) not null
);

CREATE TABLE `CONTENT`(
`contentId` int(11) not null,
`typeId` int(11) not null,
`userId` int(11) not null,
`dateUploaded` datetime not null,
`location` varchar(255) not null,
`time` datetime not null,
`status` varchar(255) not null,
`rating` int(10) not null,
`price` int not null
);

CREATE TABLE `CONTENT_TYPE`(
`typeId` int(11) not null,
`type` varchar(255) not null,
`typeDescription` varchar(255) not null
);

CREATE TABLE `MEDIAHOUSE`(
`mediaId` int(11) not null,
`contentId` int(11) not null,
`mediaName` varchar(255) not null,
`mediaEmail` varchar(255) not null,
`mediaPhoneNumber` varchar(10) not null,
`mediaAdrress` varchar(255) not null,
`mediaPassword` varchar(255) not null
);

CREATE TABLE `PAYMENT`(
`paymentId` int not null,
`contentId` int(11) not null,
`mediaId` int(11) not null,
`status` varchar(255) not null
);

ALTER TABLE `USERS`
  ADD PRIMARY KEY (`userId`);
  
ALTER TABLE `CONTENT`
  ADD PRIMARY KEY (`contentId`),
  ADD KEY `typeId`(`typeId`),
  ADD KEY `userId`(`userId`);

ALTER TABLE `MEDIAHOUSE`
  ADD PRIMARY KEY (`mediaId`),
  ADD KEY `contentId`(`contentId`);

ALTER TABLE `CONTENT_TYPE`
  ADD PRIMARY KEY (`typeId`);

ALTER TABLE `PAYMENT`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `contentId` (`contentId`),
  ADD KEY `mediaId`(`mediaId`);

show tables;
describe content;
describe users;
describe mediahouse;
describe content_type;
describe payment;

ALTER TABLE PAYMENT
  ADD FOREIGN KEY (contentId) REFERENCES CONTENT (contentId),
  ADD FOREIGN KEY (mediaId) REFERENCES MEDIAHOUSE (mediaId);

ALTER TABLE MEDIAHOUSE
  ADD FOREIGN KEY (contentId) REFERENCES CONTENT (contentId);
  
ALTER TABLE CONTENT
 ADD FOREIGN KEY (typeId) REFERENCES CONTENT_TYPE (typeId),
 ADD FOREIGN KEY (userId) REFERENCES USERS (userId);
  
  

SHOW GRANTS;
