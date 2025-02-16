--3.1 INSERT--
--a) INSERT без полей--
USE [Criminal law]
INSERT INTO dbo.Article
VALUES
	('Theft', '158', 'Secret theft of other people''s property', '10 years'),
	('Fraud', '159', 'Theft of property by deception or abuse of trust', '10 years'),
	('Bribe', '290', 'Receipt by an official personally or through an intermediary of money, securities, or other property', '4 years'),
	('Forgery of documents', '327', 'The production, forgery, or use of forged documents for the purpose of deception', '4 years'),
	('Hooliganism', '213', 'Gross violation of public order, expressing clear disrespect for society', '7 years'),
	('Illegal drug trafficking', '228', 'Illegal possession, transportation, or sale of narcotic drugs', '20 years');

INSERT INTO dbo.Lawyer
VALUES
	('Kaete', 'Guinan', '06/01/1978', '895138', '4(868)897-73-67'),
	('Assandros', 'Collins', '10/10/1962', '994678', '71(2758)766-54-91'),
	('Natalie', 'Bieber', '28/01/2003', '239994', '1(8152)847-75-00'),
	('Murdoch', 'Heisenberg', '06/05/1969', '552775', '5(1716)213-17-12'),
	('Tatjana', 'Buckley', '07/10/1986', '411793', '9(811)669-84-11'),
	('Moriko', 'Tietjens', '03/05/2000', '193447', '7(1232)584-80-79');

INSERT INTO dbo.Crime
VALUES
	('Theft', '5 years', '426406', '1', '5'),
	('Fraud', '4 years', '130600', '2', '2'),
	('Bribe', '2 years', '667972', '3', '4'),
	('Forgery of documents', '4 years', '619259', '4', '3'),
	('Hooliganism', '7 years', '538007', '5', '1'),
	('Illegal drug trafficking', '15 years', '064928', '6', '6');

INSERT INTO dbo.Recidivist
VALUES
	('Pavel', 'Lopatinsky', '19/08/2000', 'male', '3'),
	('Isabell', 'Cormac', '13/10/1992', 'female', '5'),
	('Mary', 'Mori', '18/12/1995', 'female', '2'),
	('Tristan', 'Smith', '10/06/1987', 'male', '6'),
	('Renzo', 'Gegenbauer', '22/03/1970', 'male', '4'),
	('Herman', 'Campbell', '04/09/1980', 'male', '1');

INSERT INTO dbo.Incarceration
VALUES
	('16/03/2020', '16/03/2025', 'Dark Canyon', '6'),
	('23/02/2010', '23/02/2014', 'Black Crypt', '1'),
	('18/05/2015', '18/05/2017', 'Black Crypt', '5'),
	('10/04/2016', '10/04/2020', 'Rocky Cliff', '1'),
	('22/03/2014', '22/03/2021', 'Dark Canyon', '4'),
	('27/02/2013', '27/02/2028', 'Fortress of Fortua', '3');

SELECT * FROM dbo.Article;
SELECT * FROM dbo.Crime;
SELECT * FROM dbo.Incarceration;
SELECT * FROM dbo.Lawyer;
SELECT * FROM dbo.Recidivist;

USE Theatre
INSERT INTO dbo.Director
VALUES
	('Lennon', 'Griffiths', '06/01/1978', '895138'),
	('Rimma', 'Terentyeva', '10/10/1962', '994678'),
	('Miroslav', 'Komarov', '28/01/2003', '239994'),
	('Siegfried', 'Fabry', '06/05/1969', '552775'),
	('Brutus', 'Lode', '07/10/1986', '411793'),
	('Adeia', 'Wilkinson', '03/05/2000', '193447');

INSERT INTO dbo.Actor
VALUES
	('Hedi', 'Milnor', '24/12/1969', '426406', 'Golden Mask 2020'),
	('Christof', 'Huygens', '14/08/1992', '130600', 'Breakthrough of the year 2018'),
	('Aretha', 'Germanova', '01/11/2002', '667972', 'Actor of the Year 2020'),
	('Birgith', 'Sankt', '29/10/1971', '619259', 'Actor of the Year 2018'),
	('Nahoko', 'Gregory', '07/03/1978', '538007', 'Breakthrough of the year 2023'),
	('Robert', 'Hamermesh', '28/01/1988', '064928', 'Golden applause 2023');

INSERT INTO dbo.Author
VALUES
	('Sylvia', 'Peclet', '19/08/1965', '774246', 'Golden Feather 2024'),
	('Andrew', 'Porter', '13/10/1972', '689285', 'Golden Feather 2015'),
	('Amy', 'Truesdell', '18/12/1959', '177611', 'Generational Inspiration 2015'),
	('Zinaida', 'Rodionova', '10/06/1978', '507513', 'Play of the Year 2023'),
	('Sam', 'Goldman', '22/03/1970', '476195', 'Literary masterpiece 2020'),
	('Darius', 'Vallerius', '04/09/1962', '203569', 'Literary masterpiece 2017');

INSERT INTO dbo.Play
VALUES
	('Light and Darkness', '22/07/1989', '1'),
	('Web of Illusions', '07/03/1984', '6'),
	('Peaks of Hope', '13/04/1989', '5'),
	('Echo of the Past', '30/08/1998', '2'),
	('On the Wings of A Dream', '17/02/1982', '3'),
	('Intricate Pattern', '11/05/1999', '4');


INSERT INTO dbo.Performance
VALUES
	('Shadow Dance', 'drama', '16/03/2025', '6', '4', '1'),
	('Eternal Game', 'ballet', '23/02/2025', '1', '6', '2'),
	('Labyrinths of Fate', 'musical', '18/05/2025', '5', '1', '3'),
	('Keepers of Secrets', 'drama', '10/04/2025', '1', '3', '4'),
	('Beyond the Past', 'comedy', '22/03/2025', '4', '1', '5'),
	('Faces Without Faces', 'comedy', '27/02/2025', '3', '2', '6');

INSERT INTO dbo.Theatre
VALUES
	('Art Palace', 'dramatic', '459499', '3'),
	('Magical Scene', 'puppet', '993927', '1'),
	('Paradise Theater', 'opera and ballet', '560045', '4'),
	('Epicenter Theater', 'comedy', '226727', '5'),
	('Drama Academy', 'dramatic', '724000', '2'),
	('Ramp Light', 'comedy', '137476', '6');

SELECT * FROM dbo.Actor;
SELECT * FROM dbo.Author;
SELECT * FROM dbo.Director;
SELECT * FROM dbo.Performance;
SELECT * FROM dbo.Play;
SELECT * FROM dbo.Theatre;

--b) INSERT с полями--
USE [Criminal law]
INSERT INTO dbo.Article (title, article_number, notes)
VALUES 
	('Theft', '158', 'Secret theft of other people''s property');

INSERT INTO dbo.Lawyer (first_name, last_name, date_of_birth, license_number)
VALUES
	('Moriko', 'Peclet', '20/06/1990', '724000');

INSERT INTO dbo.Crime (title, punishment, article_id, lawyer_id)
VALUES
	('Fraud', '4 years', '130600', '2', '2');

INSERT INTO dbo.Recidivist (first_name, last_name, gender, crime_id)
VALUES
	('Pavel', 'Lopatinsky', '19/08/2000', 'male', '3');

INSERT INTO dbo.Incarceration (start_at, finish_at, recidivist_id)
VALUES 
	('16/03/2020', '16/03/2025', 'Dark Canyon', '6');

SELECT * FROM dbo.Article;
SELECT * FROM dbo.Crime;
SELECT * FROM dbo.Incarceration;
SELECT * FROM dbo.Lawyer;
SELECT * FROM dbo.Recidivist;

USE Theatre
INSERT INTO dbo.Director (first_name, last_name, date_of_birth)
VALUES 
	('Brutus', 'Gregory', '02/11/1980');

INSERT INTO dbo.Actor (first_name, last_name, date_of_birth, number_phone)
VALUES
	();

INSERT INTO dbo.Author (first_name, last_name, number_phone, award)
VALUES
	();

INSERT INTO dbo.Play (title, creating_at)
VALUES
	();

INSERT INTO dbo.Performance (title, style, premiere_at, actor_id, play_id)
VALUES
	();

INSERT INTO dbo.Theatre (title, number_phone, performance_id)
VALUES
	();

SELECT * FROM dbo.Actor;
SELECT * FROM dbo.Author;
SELECT * FROM dbo.Director;
SELECT * FROM dbo.Performance;
SELECT * FROM dbo.Play;
SELECT * FROM dbo.Theatre;

--c) INSERT с чтением из другой таблицы--
USE [Criminal law]
INSERT INTO dbo.Recidivist(first_name, last_name) SELECT first_name, last_name FROM dbo.Lawyer

USE Theatre
INSERT INTO dbo.Director(first_name, last_name) SELECT first_name, last_name FROM dbo.Actor

--3.2 DELETE--
--a) DELETE всех записей--
USE [Criminal law]
DELETE FROM dbo.Article
SELECT * FROM dbo.Article
INSERT INTO dbo.Article (title, article_number, notes, maximum_sentence)
VALUES 
	('Theft', '158', 'Secret theft of other people''s property', '10 years'),
	('Fraud', '159', 'Theft of property by deception or abuse of trust', '10 years'),
	('Bribe', '290', 'Receipt by an official personally or through an intermediary of money, securities, or other property', '4 years'),
	('Forgery of documents', '327', 'The production, forgery, or use of forged documents for the purpose of deception', '4 years'),
	('Hooliganism', '213', 'Gross violation of public order, expressing clear disrespect for society', '7 years'),
	('Illegal drug trafficking', '228', 'Illegal possession, transportation, or sale of narcotic drugs', '20 years');

USE Theatre
DELETE FROM dbo.Author
SELECT * FROM dbo.Author
INSERT INTO dbo.Author (first_name, last_name, date_of_birth, number_phone, award)
VALUES 
	('Sylvia', 'Peclet', '19/08/1965', '774246', 'Golden Feather 2024'),
	('Andrew', 'Porter', '13/10/1972', '689285', 'Golden Feather 2015'),
	('Amy', 'Truesdell', '18/12/1959', '177611', 'Generational Inspiration 2015'),
	('Zinaida', 'Rodionova', '10/06/1978', '507513', 'Play of the Year 2023'),
	('Sam', 'Goldman', '22/03/1970', '476195', 'Literary masterpiece 2020'),
	('Darius', 'Vallerius', '04/09/1962', '203569', 'Literary masterpiece 2017');

--b) DELETE по условию--
USE [Criminal law]
DELETE FROM dbo.Article WHERE maximum_sentence = '10 years'
SELECT * FROM dbo.Article
INSERT INTO dbo.Article (title, article_number, notes, maximum_sentence)
VALUES 
	('Theft', '158', 'Secret theft of other people''s property', '10 years'),
	('Fraud', '159', 'Theft of property by deception or abuse of trust', '10 years');

USE Theatre
DELETE FROM dbo.Author WHERE award = 'Golden Feather 2015'
SELECT * FROM dbo.Author
INSERT INTO dbo.Author (first_name, last_name, date_of_birth, number_phone, award)
VALUES
	('Andrew', 'Porter', '13/10/1972', '689285', 'Golden Feather 2015');

--3.3 UPDATE--
--a) UPDATE всех записей--
USE [Criminal law]
SELECT * FROM dbo.Recidivist
UPDATE dbo.Recidivist
SET last_name = 'Mori'
SELECT * FROM dbo.Recidivist

USE Theatre
SELECT * FROM dbo.Director
UPDATE dbo.Director
SET last_name = 'Lode'
SELECT * FROM dbo.Director

--b) UPDATE по условию обновляя 1 атрибут--
USE [Criminal law]
SELECT * FROM dbo.Lawyer WHERE date_of_birth = '07/10/1986'
UPDATE dbo.Lawyer
SET date_of_birth = '22/07/1989'
WHERE date_of_birth = '07/10/1986'
SELECT * FROM dbo.Lawyer WHERE date_of_birth = '22/07/1989'

USE Theatre
SELECT * FROM dbo.Performance WHERE style = 'drama'
UPDATE dbo.Performance
SET style = 'ballet'
WHERE style = 'drama'
SELECT * FROM dbo.Performance WHERE style = 'ballet'

--c) UPDATE по условию обновляя несколько атрибутов--
USE [Criminal law]
UPDATE dbo.Article
SET title = 'Misappropriation', article_number = '160', maximum_sentence = '2 years'
WHERE title = 'Illegal drug trafficking'

USE Theatre
UPDATE dbo.Play
SET title = 'Dog''s heart', creating_at = '03/09/1999'
WHERE title = 'Peaks of Hope'

--3.4 SELECT--
--a) SELECT c набором извлекаемых атрибутов--
USE [Criminal law]
SELECT title, punishment FROM dbo.Crime

USE Theatre
SELECT first_name, last_name FROM dbo.Actor

--b) SELECT со всеми атрибутами--
USE [Criminal law]
SELECT * FROM dbo.Incarceration

USE Theatre
SELECT * FROM dbo.Theatre

--c) SELECT с условием по атрибуту--
USE [Criminal law]
SELECT * FROM dbo.Recidivist WHERE last_name = 'Mori'

USE Theatre
SELECT * FROM dbo.Performance WHERE title = 'Shadow Dance'

--3.5 SELECT ORDER BY + TOP (LIMIT)--
--a) SELECT ORDER BY + TOP (LIMIT) С сортировкой по возрастанию ASC + ограничение вывода количества записей--
USE [Criminal law]
SELECT TOP 3 title, article_number 
FROM dbo.Article 
ORDER BY article_number ASC;

USE Theatre
SELECT TOP 3 first_name, last_name, number_phone 
FROM dbo.Actor 
ORDER BY number_phone ASC;

--b) SELECT ORDER BY + TOP (LIMIT) С сортировкой по убыванию DESC--
USE [Criminal law]
SELECT TOP 3 title, article_number 
FROM dbo.Article 
ORDER BY article_number DESC;

USE Theatre
SELECT TOP 3 first_name, last_name, number_phone 
FROM dbo.Actor 
ORDER BY number_phone DESC;

--c) SELECT ORDER BY + TOP (LIMIT) С сортировкой по двум атрибутам + ограничение вывода количества записей--
USE [Criminal law]
SELECT TOP 3 title, maximum_sentence, article_number 
FROM dbo.Article
ORDER BY maximum_sentence ASC, article_number DESC;

USE Theatre
SELECT TOP 3 first_name, last_name, number_phone 
FROM dbo.Actor 
ORDER BY last_name ASC, number_phone DESC;

--d) SELECT ORDER BY + TOP (LIMIT) С сортировкой по первому атрибуту, из списка извлекаемых--
USE [Criminal law]
SELECT TOP 3 title, maximum_sentence
FROM dbo.Article
ORDER BY title ASC; 

USE Theatre
SELECT TOP 3 first_name, last_name
FROM dbo.Actor
ORDER BY first_name ASC; 

--3.6 Работа с датами
--a) WHERE по дате--
USE [Criminal law]
SELECT * FROM dbo.Lawyer WHERE date_of_birth = '06/01/1978'

USE Theatre
SELECT * FROM dbo.Director WHERE date_of_birth = '06/01/1978'

--b) WHERE дата в диапазоне--
USE [Criminal law]
SELECT * FROM dbo.Lawyer WHERE date_of_birth BETWEEN '01/01/1970' AND '01/01/1990'

USE Theatre
SELECT * FROM dbo.Director WHERE date_of_birth BETWEEN '01/01/1970' AND '01/01/1990'

--с) Извлечь только год из даты--
USE [Criminal law]
SELECT first_name, last_name, YEAR(date_of_birth) AS birth_year 
FROM dbo.Lawyer;

USE Theatre
SELECT first_name, last_name, YEAR(date_of_birth) AS birth_year 
FROM dbo.Director;

--3.7. Функции агрегации--
--a) Посчитать кол-во записей в таблице--
USE [Criminal law]
SELECT COUNT(*) AS total_count 
FROM dbo.Crime;

USE Theatre
SELECT COUNT(*) AS total_count 
FROM dbo.Theatre;

--b) Посчитать кол-во уникальных записей в таблице--
USE [Criminal law]
SELECT COUNT(DISTINCT title) AS unique_count 
FROM dbo.Crime;

USE Theatre
SELECT COUNT(DISTINCT title) AS unique_count 
FROM dbo.Theatre;

--c) Вывести уникальные значения столбца--
USE [Criminal law]
SELECT DISTINCT title 
FROM dbo.Crime;

USE Theatre
SELECT DISTINCT title 
FROM dbo.Theatre;

--d) Найти максимальное значение столбца--
USE [Criminal law]
SELECT MAX(crime_number) AS max_crime_number 
FROM dbo.Crime;

USE Theatre
SELECT MAX(number_phone) AS max_number_phone
FROM dbo.Theatre;

--e) Найти минимальное значение столбца--
USE [Criminal law]
SELECT MIN(crime_number) AS min_crime_number 
FROM dbo.Crime;

USE Theatre
SELECT MIN(number_phone) AS min_number_phone
FROM dbo.Theatre;

--f) Написать запрос COUNT() + GROUP BY--
USE [Criminal law]
SELECT first_name, COUNT(*) AS name_count 
FROM dbo.Lawyer
GROUP BY first_name;

USE Theatre
SELECT first_name, COUNT(*) AS name_count 
FROM dbo.Director
GROUP BY first_name; 


--3.8. SELECT GROUP BY + HAVING--
--a) Написать 3 разных запроса с использованием GROUP BY + HAVING--
USE [Criminal law]
SELECT first_name, COUNT(*) AS name_count 
FROM dbo.Lawyer 
GROUP BY first_name 
HAVING COUNT(*) > 1;

SELECT prison, COUNT(*) AS prison_count 
FROM dbo.Incarceration 
GROUP BY prison 
HAVING COUNT(*) > 1;

SELECT last_name, COUNT(*) AS surname_count 
FROM dbo.Recidivist
GROUP BY last_name 
HAVING COUNT(*) > 1;

USE Theatre
SELECT first_name, COUNT(*) AS name_count 
FROM dbo.Director 
GROUP BY first_name 
HAVING COUNT(*) > 1;

SELECT style, COUNT(*) AS style_count 
FROM dbo.Performance 
GROUP BY style 
HAVING COUNT(*) > 1;

SELECT title, COUNT(*) AS title_count 
FROM dbo.Play 
GROUP BY title 
HAVING COUNT(*) > 1;

--3.9. SELECT JOIN--
--a) LEFT JOIN двух таблиц и WHERE по одному из атрибутов--
--b) RIGHT JOIN. Получить такую же выборку, как и в 3.9a--
--c) LEFT JOIN трех таблиц + WHERE по атрибуту из каждой таблицы--
--d) INNER JOIN двух таблиц--

--3.10. Подзапросы--
--a) Написать запрос с условием WHERE IN (подзапрос)--
--b) Написать запрос SELECT atr1, atr2, (подзапрос) FROM ...--
--c) Написать запрос вида SELECT * FROM (подзапрос)--
--d) Написать запрос вида SELECT * FROM table JOIN (подзапрос) ON …--