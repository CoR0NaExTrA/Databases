USE [Criminal law]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Article')
	CREATE TABLE dbo.Article(
		article_id INT IDENTITY(1,1) NOT NULL,

		title NVARCHAR(50) NOT NULL,
		article_number NVARCHAR(50) NOT NULL,
		notes NVARCHAR(200) NOT NULL,
		maximum_sentence NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_article_article_id PRIMARY KEY (article_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Lawyer')
	CREATE TABLE dbo.Lawyer(
		lawyer_id INT IDENTITY(1,1) NOT NULL,

		first_name NVARCHAR(50) NOT NULL,
		last_name NVARCHAR(50) NOT NULL,
		date_of_birth DATETIME NOT NULL,
		license_number INT NOT NULL,
		contact_info NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_performance_performance_id PRIMARY KEY (lawyer_id),
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Crime')
	CREATE TABLE dbo.Crime(
		crime_id INT IDENTITY(1,1) NOT NULL,

		title NVARCHAR(50) NOT NULL,
		punishment NVARCHAR(50) NOT NULL,
		crime_number INT NOT NULL,
		article_id INT NOT NULL,
		lawyer_id INT NOT NULL,

		CONSTRAINT PK_crime_crime_id PRIMARY KEY (crime_id),
		CONSTRAINT FK_crime_article_id
			FOREIGN KEY (article_id) REFERENCES dbo.Article(article_id),
		CONSTRAINT FK_crime_lawyer_id
			FOREIGN KEY (lawyer_id) REFERENCES dbo.Lawyer(lawyer_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Recidivist')
	CREATE TABLE dbo.Recidivist(
		recidivist_id INT IDENTITY(1,1) NOT NULL,

		first_name NVARCHAR(50) NOT NULL,
		last_name NVARCHAR(50) NOT NULL,
		date_of_birth DATETIME NOT NULL,
		gender NVARCHAR(50) NOT NULL,
		crime_id INT NOT NULL,

		CONSTRAINT PK_recidivist_recidivist_id PRIMARY KEY (recidivist_id)
	)

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Incarceration')
	CREATE TABLE dbo.Incarceration(
		incarceration_id INT IDENTITY(1,1) NOT NULL,

		start_at DATETIME NOT NULL,
		finish_at DATETIME NOT NULL,
		prison NVARCHAR(50) NOT NULL,
		recidivist_id INT NOT NULL,
		crime_id INT NOT NULL,

		CONSTRAINT PK_incarceration_incarceration_id PRIMARY KEY (incarceration_id),
		CONSTRAINT FK_incarceration_recidivist_id 
			FOREIGN KEY (recidivist_id) REFERENCES dbo.Recidivist(recidivist_id),
		CONSTRAINT FK_recidivist_crime_id 
			FOREIGN KEY (crime_id) REFERENCES dbo.Crime(crime_id)
	)

SELECT * FROM dbo.Lawyer;