USE Theatre
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Director')
	CREATE TABLE dbo.Director(
		director_id INT IDENTITY(1,1) NOT NULL,

		first_name NVARCHAR(50) NOT NULL,
		last_name NVARCHAR(50) NOT NULL,
		date_of_birth DATETIME NOT NULL,
		number_phone NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_director_director_id PRIMARY KEY (director_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Actor')
	CREATE TABLE dbo.Actor(
		actor_id INT IDENTITY(1,1) NOT NULL,

		first_name NVARCHAR(50) NOT NULL,
		last_name NVARCHAR(50) NOT NULL,
		date_of_birth DATETIME NOT NULL,
		number_phone NVARCHAR(50) NOT NULL,
		award NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_actor_actor_id PRIMARY KEY (actor_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Author')
	CREATE TABLE dbo.Author(
		author_id INT IDENTITY(1,1) NOT NULL,

		first_name NVARCHAR(50) NOT NULL,
		last_name NVARCHAR(50) NOT NULL,
		date_of_birth DATETIME NOT NULL,
		number_phone NVARCHAR(50) NOT NULL,
		award NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_author_author_id PRIMARY KEY (author_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Play')
	CREATE TABLE dbo.Play(
		play_id INT IDENTITY(1,1) NOT NULL,

		title NVARCHAR(50) NOT NULL,
		creating_at DATETIME NOT NULL,
		author_id INT NOT NULL,

		CONSTRAINT PK_play_play_id PRIMARY KEY (play_id),
		CONSTRAINT FK_play_author_id 
			FOREIGN KEY (author_id) REFERENCES dbo.Author(author_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Performance')
	CREATE TABLE dbo.Performance(
		performance_id INT IDENTITY(1,1) NOT NULL,

		title NVARCHAR(50) NOT NULL,
		style NVARCHAR(50) NOT NULL,
		premiere_at DATETIME NOT NULL,
		role_id INT NOT NULL,
		director_id INT NOT NULL,
		play_id INT NOT NULL,

		CONSTRAINT PK_performance_performance_id PRIMARY KEY (performance_id),
		CONSTRAINT FK_performance_director_id 
			FOREIGN KEY (director_id) REFERENCES dbo.Director(director_id),
		CONSTRAINT FK_performance_role_id 
			FOREIGN KEY (role_id) REFERENCES dbo.[Role](role_id),
		CONSTRAINT FK_performance_play_id
			FOREIGN KEY (play_id) REFERENCES dbo.Play(play_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Role')
	CREATE TABLE dbo.[Role](
		role_id INT IDENTITY(1,1) NOT NULL,

		role_name NVARCHAR(50) NOT NULL,
		role_type NVARCHAR(50) NOT NULL,
		notes NVARCHAR(100) NOT NULL,
		performance_id INT NOT NULL,
		actor_id INT NOT NULL,

		CONSTRAINT PK_role_role_id PRIMARY KEY (role_id),
		CONSTRAINT FK_role_actor_id
			FOREIGN KEY (actor_id) REFERENCES dbo.Actor(actor_id),
		CONSTRAINT FK_role_actor_id
			FOREIGN KEY (performance_id) REFERENCES dbo.Performance(performance_id)
	)


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Theatre')
	CREATE TABLE dbo.Theatre(
		theatre_id INT IDENTITY(1,1) NOT NULL,

		title NVARCHAR(50) NOT NULL,
		style NVARCHAR(50) NOT NULL,
		number_phone NVARCHAR(50) NOT NULL,
		performance_id INT NOT NULL,

		CONSTRAINT PK_theatre_theatre_id PRIMARY KEY (theatre_id),
		CONSTRAINT FK_theatre_performance_id
			FOREIGN KEY (performance_id) REFERENCES dbo.Performance(performance_id)
	)

SELECT * FROM dbo.[Role];