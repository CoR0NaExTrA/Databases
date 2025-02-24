USE Pharmacy

--1. Добавить внешних ключей
/* ALTER TABLE dbo.dealer
ADD CONSTRAINT FK_dealer_company
	FOREIGN KEY (id_company) REFERENCES dbo.company(id_company);

ALTER TABLE dbo.production
ADD CONSTRAINT FK_production_company
	FOREIGN KEY (id_company) REFERENCES dbo.company(id_company);
ALTER TABLE dbo.production
ADD CONSTRAINT FK_production_medicine
	FOREIGN KEY (id_medicine) REFERENCES dbo.medicine(id_medicine);

ALTER TABLE dbo.[order]
ADD CONSTRAINT FK_order_production
	FOREIGN KEY (id_production) REFERENCES dbo.production(id_production);
ALTER TABLE dbo.[order]
ADD CONSTRAINT FK_order_dealer
	FOREIGN KEY (id_dealer) REFERENCES dbo.dealer(id_dealer);
ALTER TABLE dbo.[order]
ADD CONSTRAINT FK_order_pharmacy
	FOREIGN KEY (id_pharmacy) REFERENCES dbo.pharmacy(id_pharmacy); */

--2. Выдать информацию по всем заказам лекарствам “Кордерон” компании “Аргус”--
--с указанием названий аптек, дат, объема заказов.--
SELECT 
    ph.name AS pharmacy_name,
    o.date AS order_date,
    o.quantity AS order_volume
FROM dbo.[order] o
JOIN dbo.production p ON o.id_production = p.id_production
JOIN dbo.medicine m ON p.id_medicine = m.id_medicine
JOIN dbo.company c ON p.id_company = c.id_company
JOIN dbo.pharmacy ph ON o.id_pharmacy = ph.id_pharmacy
WHERE m.name = 'Кордерон' AND c.name = 'Аргус';

--3. Дать список лекарств компании “Фарма”, на которые не были сделаны заказы--
--до 25 января.--
SELECT 
    m.name AS medicine_name
FROM dbo.medicine m
JOIN dbo.production p ON m.id_medicine = p.id_medicine
JOIN dbo.company c ON p.id_company = c.id_company
LEFT JOIN dbo.[order] o ON p.id_production = o.id_production 
                          AND o.date < '2025-01-25'
WHERE 
    c.name = 'Фарма'
    AND o.id_order IS NULL;


--4. Дать минимальный и максимальный баллы лекарств каждой фирмы, которая--
--оформила не менее 120 заказов.--
SELECT 
    c.name AS company_name,
    MIN(p.rating) AS min_rating,
    MAX(p.rating) AS max_rating
FROM dbo.company c
JOIN dbo.production p ON c.id_company = p.id_company
JOIN dbo.[order] o ON p.id_production = o.id_production
GROUP BY c.name
HAVING COUNT(o.id_order) >= 120;


--5. Дать списки сделавших заказы аптек по всем дилерам компании “AstraZeneca”.--
--Если у дилера нет заказов, в названии аптеки проставить NULL.--
SELECT 
    d.name AS dealer_name,
    ph.name AS pharmacy_name
FROM dbo.dealer d
JOIN dbo.company c ON d.id_company = c.id_company
LEFT JOIN dbo.[order] o ON d.id_dealer = o.id_dealer
LEFT JOIN dbo.pharmacy ph ON o.id_pharmacy = ph.id_pharmacy
WHERE c.name = 'AstraZeneca';

--6. Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а--
--длительность лечения не более 7 дней.--
SELECT p.id_production, m.name, p.price, m.cure_duration
FROM dbo.production p
JOIN dbo.medicine m ON p.id_medicine = m.id_medicine
WHERE p.price > 3000 AND m.cure_duration <= 7;

UPDATE dbo.production
SET price = price * 0.8
FROM dbo.production p
JOIN dbo.medicine m ON p.id_medicine = m.id_medicine
WHERE p.price > 3000 AND m.cure_duration <= 7;

SELECT p.id_production, m.name, p.price, m.cure_duration
FROM dbo.production p
JOIN dbo.medicine m ON p.id_medicine = m.id_medicine
WHERE p.price > 2400 AND m.cure_duration <= 7;

--7. Добавить необходимые индексы.--
--Индексы для ускорения выборок по названию компании и лекарств--
CREATE INDEX idx_company_name ON dbo.company (name);
CREATE INDEX idx_medicine_name ON dbo.medicine (name);

--Индекс для ускорения соединений по id компании--
CREATE INDEX idx_production_id_company ON dbo.production (id_company);

--Индекс для ускорения выборок по дате в заказах--
CREATE INDEX idx_order_date ON dbo.[order] (date);

--Индексы для ускорения соединений между таблицами--
CREATE INDEX idx_order_id_production ON dbo.[order] (id_production);
CREATE INDEX idx_order_id_pharmacy ON dbo.[order] (id_pharmacy);
CREATE INDEX idx_production_id_medicine ON dbo.production (id_medicine);

--Индекс для ускорения выборок по стоимости и длительности курса--
CREATE INDEX idx_production_price ON dbo.production (price);
CREATE INDEX idx_medicine_cure_duration ON dbo.medicine (cure_duration);
