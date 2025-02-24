USE Hotels

--1. �������� ������� �����.--
--ALTER TABLE dbo.booking
--ADD CONSTRAINT FK_booking_client
--	FOREIGN KEY (id_client) REFERENCES dbo.client(id_client);

--ALTER TABLE dbo.room
--ADD CONSTRAINT FK_room_hotel
--	FOREIGN KEY (id_hotel) REFERENCES dbo.hotel(id_hotel);

--ALTER TABLE dbo.room
--ADD CONSTRAINT FK_room_room_category
--	FOREIGN KEY (id_room_category) REFERENCES dbo.room_category(id_room_category);

--ALTER TABLE dbo.room_in_booking
--ADD CONSTRAINT FK_room_in_booking_booking
--	FOREIGN KEY (id_booking) REFERENCES dbo.booking(id_booking);

--ALTER TABLE dbo.room_in_booking
--ADD CONSTRAINT FK_room_in_booking_room
--	FOREIGN KEY (id_room) REFERENCES dbo.room(id_room);

--2. ������ ���������� � �������� ��������� �������, ����������� � �������--
--��������� ����� �� 1 ������ 2019�.--
SELECT c.id_client, c.name, c.phone
FROM dbo.client c
JOIN dbo.booking b ON c.id_client = b.id_client
JOIN dbo.room_in_booking rib ON b.id_booking = rib.id_booking
JOIN dbo.room r ON rib.id_room = r.id_room
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
JOIN dbo.room_category rc ON r.id_room_category = rc.id_room_category
WHERE h.name = '������'
AND rc.name = '����'
AND '2019-04-01' BETWEEN rib.checkin_date AND rib.checkout_date;

--3. ���� ������ ��������� ������� ���� �������� �� 22 ������.--
SELECT r.id_room, r.number AS room_number, h.name AS hotel_name
FROM dbo.room r
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
WHERE r.id_room NOT IN (
    SELECT rib.id_room
    FROM dbo.room_in_booking rib
    WHERE '2024-04-22' BETWEEN rib.checkin_date AND rib.checkout_date
);

--4. ���� ���������� ����������� � ��������� ������� �� 23 ����� �� ������--
--��������� �������--
SELECT rc.name AS room_category, COUNT(rib.id_room) AS guest_count
FROM dbo.room_in_booking rib
JOIN dbo.room r ON rib.id_room = r.id_room
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
JOIN dbo.room_category rc ON r.id_room_category = rc.id_room_category
WHERE h.name = '������' 
  AND '2024-03-23' BETWEEN rib.checkin_date AND rib.checkout_date
GROUP BY rc.name;

--5. ���� ������ ��������� ����������� �������� �� ���� �������� ���������--
--�������, ��������� � ������ � ��������� ���� ������.--
WITH LastGuests AS (
    SELECT 
        rib.id_room,
        c.name AS client_name,
        rib.checkout_date,
        ROW_NUMBER() OVER (PARTITION BY rib.id_room ORDER BY rib.checkout_date DESC) AS rn
    FROM dbo.room_in_booking rib
    JOIN dbo.booking b ON rib.id_booking = b.id_booking
    JOIN dbo.client c ON b.id_client = c.id_client
    JOIN dbo.room r ON rib.id_room = r.id_room
    JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
    WHERE h.name = '������'
      AND rib.checkout_date BETWEEN '2024-04-01' AND '2024-04-30'
)
SELECT id_room, client_name, checkout_date
FROM LastGuests
WHERE rn = 1;

--6. �������� �� 2 ��� ���� ���������� � ��������� ������� ���� ��������--
--������ ��������� �������, ������� ���������� 10 ���.--
UPDATE rib
SET checkout_date = DATEADD(DAY, 2, checkout_date)
FROM dbo.room_in_booking rib
JOIN dbo.room r ON rib.id_room = r.id_room
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
JOIN dbo.room_category rc ON r.id_room_category = rc.id_room_category
WHERE h.name = '������'
  AND rc.name = '������'
  AND rib.checkin_date = '2025-05-10';

--7. ����� ��� "��������������" �������� ����������. ���������� ���������: ��--
--����� ���� ������������ ���� ����� �� ���� ���� ��������� ���, �.�. ������--
--���������� ���������� �������� � ���� �����. ������ � �������--
--room_in_booking � id_room_in_booking = 5 � 2154 �������� ��������--
--������������� ���������, ������� ���������� �����. �������������� ������--
--������� ������ ��������� ���������� � ���� ������������� �������.--
SELECT rib1.id_room_in_booking AS booking_id_1, rib1.id_room, rib1.checkin_date, rib1.checkout_date,
       rib2.id_room_in_booking AS booking_id_2, rib2.id_room, rib2.checkin_date, rib2.checkout_date
FROM dbo.room_in_booking rib1
JOIN dbo.room_in_booking rib2 
    ON rib1.id_room = rib2.id_room  -- ���� � ��� �� �����
    AND rib1.id_room_in_booking <> rib2.id_room_in_booking  -- ��������� ���������� ����� � ��� �� ������
    AND rib1.checkin_date < rib2.checkout_date  -- ����������� �� �����
    AND rib1.checkout_date > rib2.checkin_date  -- ����������� �� �����
--WHERE rib1.id_room_in_booking = 5 OR rib2.id_room_in_booking = 2154
ORDER BY rib1.id_room, rib1.checkin_date;
