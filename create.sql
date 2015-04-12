CREATE TABLE User
(
	UserID 			INT(11) NOT NULL,
	Username		VARCHAR(20) NOT NULL,
	Email			VARCHAR(100) NOT NULL,
	Password		VARCHAR(20) NOT NULL,

	PRIMARY KEY(UserID)
);

CREATE TABLE UserInfo
(
	UserID 			INT(11) NOT NULL,
	Firstname		VARCHAR(100) NOT NULL,
	Lastname		VARCHAR(100) NOT NULL，
	Gender			VARCHAR(6) NOT NULL,
	QuestGiverRating DECIMAL(3,2) NOT NULL,
	AdventurerRating DECIMAL(3,2) NOT NULL,

	PRIMARY KEY(UserID)
	FOREIGN KEY (UserID) 
        REFERENCES User(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE UserPhoneNumber
(
	UserID			INT(11) NOT NULL,
	PhoneNumber 	INT(10) NOT NULL,

	PRIMARY KEY(UserID, PhoneNumber)
	FOREIGN KEY (UserID) 
        REFERENCES User(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE UserAddress
(
	UserID			INT(11) NOT NULL,
	Country			VARCHAR(20) NOT NULL,
	State			VARCHAR(2) NOT NULL,
	Zipcode			INT(5) NOT NULL,
	Address 		VARCHAR(100) NOT NULL

	PRIMARY KEY(UserID)
	FOREIGN KEY (UserID) 
        REFERENCES User(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Quest
(
	QuestID			INT(11) NOT NULL,
	QuestGiverID	INT(11) NOT NULL,
	AdventurerID	INT(11) NOT NULL,
	Title 			VARCHAR(100) NOT NULL,
	Price			DECIMAL(8,2) NOT NULL,
	Desciption		VARCHAR(1000) NOT NULL,
	PostTime		TIMESTAMP NOT NULL,
	ExpirationTime	TIMESTAMP NOT NULL,

	PRIMARY KEY(QuestID)
);

CREATE TABLE PendingAdventurer
(
	QuestID			INT(11) NOT NULL,
	AdventurerID	INT(11) NOT NULL,

	PRIMARY KEY(QuestID, AdventurerID)
	FOREIGN KEY (QuestID) 
        REFERENCES Quest(QuestID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);