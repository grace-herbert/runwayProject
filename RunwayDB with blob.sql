DROP DATABASE IF EXISTS runway;
CREATE DATABASE runway;
USE runway;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
userID varchar(25),
fName varchar(15),
lName varchar(25),
PRIMARY KEY (userID)
);

DROP TABLE IF EXISTS login;

CREATE TABLE login(
email varchar(500),
hKey varchar(2550),
isLoggedIn tinyint,
lastLogin dateTime,
PRIMARY KEY (email)
);

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts(
accountID varchar(25),
userID varchar(25),
email varchar (500),
PRIMARY KEY (accountID),
CONSTRAINT FK_accUserID FOREIGN KEY (userID) REFERENCES users(userID),
CONSTRAINT FK_accEmail FOREIGN KEY (email) REFERENCES login(email)
);

DROP TABLE IF EXISTS vault;

CREATE TABLE vault(
vaultID varchar(25),
accountID varchar(25),
fileID varchar(225),
PRIMARY KEY (vaultID),
CONSTRAINT FK_vAccountID FOREIGN KEY (accountID) REFERENCES accounts(accountID),
CONSTRAINT FK_vFileID FOREIGN KEY (fileID) REFERENCES files(fileID)
);

DROP TABLE IF EXISTS files;

CREATE TABLE files(
fileID varchar(225),
vaultID varchar(25),
fileName varchar(30),
fileType varchar (5),
fileSize int,
fileDateID varchar(25),
fileItem blob,
PRIMARY KEY (fileID),
CONSTRAINT FK_fFileDateID FOREIGN KEY (fileDateID) REFERENCES fileDateID(fileDateID)
);
ALTER TABLE files ADD CONSTRAINT FK_fVaultID FOREIGN KEY (vaultID) REFERENCES vault(vaultID);

DROP TABLE IF EXISTS fileDateID;

CREATE TABLE fileDateID(
fileDateID varchar(25),
uploadDate datetime,
lastModified datetime,
lastAccessDate datetime,
PRIMARY KEY (fileDateID)
);



