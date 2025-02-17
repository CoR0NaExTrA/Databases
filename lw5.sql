USE Pharmacy

--1. Добавить внешних ключей
ALTER TABLE dbo.dealer
ADD CONSTRAINT FK_dealer_company
	FOREIGN KEY (id_company) REFERENCES dbo.company(id_company);

ALTER TABLE dbo.production
ADD CONSTRAINT FK_production_company
	FOREIGN KEY (id_company) REFERENCES dbo.company(id_company),
ADD CONSTRAINT FK_production_medicine
	FOREIGN KEY (id_medicine) REFERENCES dbo.medicine(id_medicine);

ALTER TABLE dbo.[order]
ADD CONSTRAINT FK_order_production
	FOREIGN KEY (id_production) REFERENCES dbo.production(id_production),
ADD CONSTRAINT FK_order_dealer
	FOREIGN KEY (id_dealer) REFERENCES dbo.dealer(id_dealer),
ADD CONSTRAINT FK_order_pharmacy
	FOREIGN KEY (id_pharmacy) REFERENCES dbo.pharmacy(id_pharmacy);

--2. Выдать информацию по всем заказам лекарствам “Кордерон” компании “Аргус”--
--с указанием названий аптек, дат, объема заказов.--


--3. Дать список лекарств компании “Фарма”, на которые не были сделаны заказы--
--до 25 января.--


--4. Дать минимальный и максимальный баллы лекарств каждой фирмы, которая--
--оформила не менее 120 заказов.--


--5. Дать списки сделавших заказы аптек по всем дилерам компании “AstraZeneca”.--
--Если у дилера нет заказов, в названии аптеки проставить NULL.--


--6. Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а--
--длительность лечения не более 7 дней.--


--7. Добавить необходимые индексы.--
