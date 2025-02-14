IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Theatre')
	CREATE TABLE dbo.Theatre(
		theatre_id INT IDENTITY(1,1) NOT NULL,

		theatre_name NVARCHAR(50) NOT NULL,
		theatre_type NVARCHAR(50) NOT NULL,
		theatre_number NVARCHAR(50) NOT NULL,
		theatre_isOpen BIT NOT NULL,

		CONSTRAINT PK_theatre_theatre_id PRIMARY KEY (theatre_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Director')
	CREATE TABLE dbo.Director(
		director_id INT IDENTITY(1,1) NOT NULL,

		director_name NVARCHAR(50) NOT NULL,
		director_surname NVARCHAR(50) NOT NULL,
		director_birthdate NVARCHAR(50) NOT NULL,
		director_number NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_director_director_id PRIMARY KEY (director_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Actor')
	CREATE TABLE dbo.Actor(
		actor_id INT IDENTITY(1,1) NOT NULL,

		actor_name NVARCHAR(50) NOT NULL,
		actor_surname NVARCHAR(50) NOT NULL,
		actor_birthdate NVARCHAR(50) NOT NULL,
		actor_number NVARCHAR(50) NOT NULL,
		actor_award NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_actor_actor_id PRIMARY KEY (actor_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Author')
	CREATE TABLE dbo.Author(
		author_id INT IDENTITY(1,1) NOT NULL,

		author_name NVARCHAR(50) NOT NULL,
		author_surname NVARCHAR(50) NOT NULL,
		author_birthdate DATETIME NOT NULL,
		author_number NVARCHAR(50) NOT NULL,
		author_award NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_author_author_id PRIMARY KEY (author_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Performance')
	CREATE TABLE dbo.Performance(
		performance_id INT IDENTITY(1,1) NOT NULL,

		performance_name NVARCHAR(50) NOT NULL,
		performance_type NVARCHAR(50) NOT NULL,
		performance_premiere DATETIME NOT NULL,
		actor_id INT NOT NULL,
		director_id INT NOT NULL,

		CONSTRAINT PK_performance_performance_id PRIMARY KEY (performance_id),
		CONSTRAINT FK_performance_director_id 
			FOREIGN KEY (director_id) REFERENCES dbo.Director(director_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Play')
	CREATE TABLE dbo.Play(
		play_id INT IDENTITY(1,1) NOT NULL,

		play_name NVARCHAR(50) NOT NULL,
		play_creating DATETIME NOT NULL,
		author_id INT NOT NULL,
		performance_id INT NOT NULL,

		CONSTRAINT PK_theatre_theatre_id PRIMARY KEY (play_id),
		CONSTRAINT FK_play_author_id 
			FOREIGN KEY (author_id) REFERENCES dbo.Author(author_id),
		CONSTRAINT FK_play_performance_id 
			FOREIGN KEY (performance_id) REFERENCES dbo.Performance(performance_id)
	)

INSERT INTO dbo.Theatre (theatre_name, theatre_type, theatre_number, theatre_isOpen)
VALUES 
	('Art Palace', 'dramatic', '459499', 'true'),
	('Magical Scene', 'puppet', '993927', 'false'),
	('Paradise Theater', 'opera and ballet', '560045', 'true'),
	('Epicenter Theater', 'comedy', '226727', 'false'),
	('Drama Academy', 'dramatic', '724000', 'false'),
	('Ramp Light', 'comedy', '137476', 'true');

INSERT INTO dbo.Director (director_name,  director_surname, director_birthdate, director_number)
VALUES 
	('Lennon', 'Griffiths', '06/01/1978', '895138'),
	('Rimma', 'Terentyeva', '10/10/1962', '994678'),
	('Miroslav', 'Komarov', '28/01/2003', '239994'),
	('Siegfried', 'Fabry', '06/05/1969', '552775'),
	('Brutus', 'Lode', '07/10/1986', '411793'),
	('Adeia', 'Wilkinson', '03/05/2000', '193447');

INSERT INTO dbo.Actor (actor_name, actor_surname, actor_birthdate, actor_number, actor_award)
VALUES 
	('Hedi', 'Milnor', '24/12/1969', '426406', 'Golden Mask 2020'),
	('Christof', 'Huygens', '14/08/1992', '130600', 'Breakthrough of the year 2018'),
	('Aretha', 'Germanova', '01/11/2002', '667972', 'Actor of the Year 2020'),
	('Birgith', 'Sankt', '29/10/1971', '619259', 'Actor of the Year 2018'),
	('Nahoko', 'Gregory', '07/03/1978', '538007', 'Breakthrough of the year 2023'),
	('Robert', 'Hamermesh', '28/01/1988', '064928', 'Golden applause 2023');

INSERT INTO dbo.Author (author_name, author_surname, author_birthdate, author_number, author_award)
VALUES 
	('Sylvia', 'Peclet', '19/08/1965', '774246', 'Golden Feather 2024'),
	('Andrew', 'Porter', '13/10/1972', '689285', 'Golden Feather 2015'),
	('Amy', 'Truesdell', '18/12/1959', '177611', 'Generational Inspiration 2015'),
	('Zinaida', 'Rodionova', '10/06/1978', '507513', 'Play of the Year 2023'),
	('Sam', 'Goldman', '22/03/1970', '476195', 'Literary masterpiece 2020'),
	('Darius', 'Vallerius', '04/09/1962', '203569', 'Literary masterpiece 2017');

INSERT INTO dbo.Performance (performance_name, performance_type, performance_premiere, actor_id, director_id)
VALUES 
	('Shadow Dance', 'drama', '16/03/2025', '6', '4'),
	('Eternal Game', 'ballet', '23/02/2025', '1', '6'),
	('Labyrinths of Fate', 'musical', '18/05/2025', '5', '1'),
	('Keepers of Secrets', 'drama', '10/04/2025', '1', '3'),
	('Beyond the Past', 'comedy', '22/03/2025', '4', '1'),
	('Faces Without Faces', 'comedy', '27/02/2025', '3', '2');

INSERT INTO dbo.Play (play_name, play_creating, author_id, performance_id)
VALUES 
	('Light and Darkness', '22/07/1989', '1', '1'),
	('Web of Illusions', '07/03/1984', '6', '2'),
	('Peaks of Hope', '13/04/1989', '5', '3'),
	('Echo of the Past', '30/08/1998', '2', '4'),
	('On the Wings of A Dream', '17/02/1982', '3', '5'),
	('Intricate Pattern', '11/05/1999', '4', '6');