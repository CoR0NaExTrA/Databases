USE [Criminal law]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Article')
	CREATE TABLE dbo.Article(
		article_id INT IDENTITY(1,1) NOT NULL,

		article_title NVARCHAR(50) NOT NULL,
		article_number NVARCHAR(50) NOT NULL,
		article_description NVARCHAR(200) NOT NULL,
		maximum_sentence NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_article_article_id PRIMARY KEY (article_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Lawyer')
	CREATE TABLE dbo.Lawyer(
		lawyer_id INT IDENTITY(1,1) NOT NULL,

		lawyer_name NVARCHAR(50) NOT NULL,
		lawyer_surname NVARCHAR(50) NOT NULL,
		lawyer_birthday NVARCHAR(50) NOT NULL,
		lawyer_license_number NVARCHAR(50) NOT NULL,
		lawyer_contact NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_performance_performance_id PRIMARY KEY (lawyer_id),
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Crime')
	CREATE TABLE dbo.Crime(
		crime_id INT IDENTITY(1,1) NOT NULL,

		crime_title NVARCHAR(50) NOT NULL,
		crime_punishment NVARCHAR(50) NOT NULL,
		article_id INT NOT NULL,
		lawyer_id INT NOT NULL,
		crime_number NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_crime_crime_id PRIMARY KEY (crime_id),
		CONSTRAINT FK_crime_article_id
			FOREIGN KEY (article_id) REFERENCES dbo.Article(article_id),
		CONSTRAINT FK_crime_lawyer_id
			FOREIGN KEY (lawyer_id) REFERENCES dbo.Lawyer(lawyer_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Recidivist')
	CREATE TABLE dbo.Recidivist(
		recidivist_id INT IDENTITY(1,1) NOT NULL,

		recidivist_name NVARCHAR(50) NOT NULL,
		recidivist_surname NVARCHAR(50) NOT NULL,
		recidivist_birthdate DATETIME NOT NULL,
		recidivist_gender NVARCHAR(50) NOT NULL,
		crime_id INT NOT NULL,

		CONSTRAINT PK_recidivist_recidivist_id PRIMARY KEY (recidivist_id),
		CONSTRAINT FK_recidivist_crime_id 
			FOREIGN KEY (crime_id) REFERENCES dbo.Crime(crime_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Incarceration')
	CREATE TABLE dbo.Incarceration(
		incarceration_id INT IDENTITY(1,1) NOT NULL,

		incarceration_start DATETIME NOT NULL,
		incarceration_finish DATETIME NOT NULL,
		recidivist_id INT NOT NULL,
		incarceration_prison NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_incarceration_incarceration_id PRIMARY KEY (incarceration_id),
		CONSTRAINT FK_incarceration_recidivist_id 
			FOREIGN KEY (recidivist_id) REFERENCES dbo.Recidivist(recidivist_id)
	)


INSERT INTO dbo.Article (article_title, article_number, article_description, maximum_sentence)
VALUES 
	('Theft', '158', 'Secret theft of other people''s property', '10 years'),
	('Fraud', '159', 'Theft of property by deception or abuse of trust', '10 years'),
	('Bribe', '290', 'Receipt by an official personally or through an intermediary of money, securities, or other property', '4 years'),
	('Forgery of documents', '327', 'The production, forgery, or use of forged documents for the purpose of deception', '4 years'),
	('Hooliganism', '213', 'Gross violation of public order, expressing clear disrespect for society', '7 years'),
	('Illegal drug trafficking', '228', 'Illegal possession, transportation, or sale of narcotic drugs', '20 years');

INSERT INTO dbo.Lawyer (lawyer_name, lawyer_surname, lawyer_birthday, lawyer_license_number, lawyer_contact)
VALUES 
	('Kaete', 'Guinan', '06/01/1978', '895138', '4(868)897-73-67'),
	('Assandros', 'Collins', '10/10/1962', '994678', '71(2758)766-54-91'),
	('Natalie', 'Bieber', '28/01/2003', '239994', '1(8152)847-75-00'),
	('Murdoch', 'Heisenberg', '06/05/1969', '552775', '5(1716)213-17-12'),
	('Tatjana', 'Buckley', '07/10/1986', '411793', '9(811)669-84-11'),
	('Moriko', 'Tietjens', '03/05/2000', '193447', '7(1232)584-80-79');

INSERT INTO dbo.Crime (crime_title, crime_punishment, article_id, crime_number, lawyer_id)
VALUES 
	('Theft', '5 years', '1', '426406', '5'),
	('Fraud', '4 years', '2', '130600', '2'),
	('Bribe', '2 years', '3', '667972', '4'),
	('Forgery of documents', '4 years', '4', '619259', '3'),
	('Hooliganism', '7 years', '5', '538007', '1'),
	('Illegal drug trafficking', '15 years', '6', '064928', '6');

INSERT INTO dbo.Recidivist (recidivist_name, recidivist_surname, recidivist_birthdate, recidivist_gender, crime_id)
VALUES 
	('Pavel', 'Lopatinsky', '19/08/2000', 'male', '3'),
	('Isabell', 'Cormac', '13/10/1992', 'female', '5'),
	('Mary', 'Mori', '18/12/1995', 'female', '2'),
	('Tristan', 'Smith', '10/06/1987', 'male', '6'),
	('Renzo', 'Gegenbauer', '22/03/1970', 'male', '4'),
	('Herman', 'Campbell', '04/09/1980', 'male', '1');

INSERT INTO dbo.Incarceration (incarceration_start, incarceration_finish, recidivist_id, incarceration_prison)
VALUES 
	('16/03/2020', '16/03/2025', '6', 'Dark Canyon'),
	('23/02/2010', '23/02/2014', '1', 'Black Crypt'),
	('18/05/2015', '18/05/2017', '5', 'Black Crypt'),
	('10/04/2016', '10/04/2020', '1', 'Rocky Cliff'),
	('22/03/2014', '22/03/2021', '4', 'Dark Canyon'),
	('27/02/2013', '27/02/2028', '3', 'Fortress of Fortua');

SELECT * FROM dbo.Lawyer;