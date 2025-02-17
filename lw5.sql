USE Pharmacy

--1. �������� ������� ������
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

--2. ������ ���������� �� ���� ������� ���������� ��������� �������� ������--
--� ��������� �������� �����, ���, ������ �������.--


--3. ���� ������ �������� �������� �������, �� ������� �� ���� ������� ������--
--�� 25 ������.--


--4. ���� ����������� � ������������ ����� �������� ������ �����, �������--
--�������� �� ����� 120 �������.--


--5. ���� ������ ��������� ������ ����� �� ���� ������� �������� �AstraZeneca�.--
--���� � ������ ��� �������, � �������� ������ ���������� NULL.--


--6. ��������� �� 20% ��������� ���� ��������, ���� ��� ��������� 3000, �--
--������������ ������� �� ����� 7 ����.--


--7. �������� ����������� �������.--
