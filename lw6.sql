USE Hotels

--1. Добавить внешние ключи.--
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

--2. Выдать информацию о клиентах гостиницы “Космос”, проживающих в номерах--
--категории “Люкс” на 1 апреля 2019г.--
SELECT c.id_client, c.name, c.phone
FROM dbo.client c
JOIN dbo.booking b ON c.id_client = b.id_client
JOIN dbo.room_in_booking rib ON b.id_booking = rib.id_booking
JOIN dbo.room r ON rib.id_room = r.id_room
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
JOIN dbo.room_category rc ON r.id_room_category = rc.id_room_category
WHERE h.name = 'Космос'
AND rc.name = 'Люкс'
AND '2019-04-01' BETWEEN rib.checkin_date AND rib.checkout_date;

--3. Дать список свободных номеров всех гостиниц на 22 апреля.--
SELECT r.id_room, r.number AS room_number, h.name AS hotel_name
FROM dbo.room r
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
WHERE r.id_room NOT IN (
    SELECT rib.id_room
    FROM dbo.room_in_booking rib
    WHERE '2024-04-22' BETWEEN rib.checkin_date AND rib.checkout_date
);

--4. Дать количество проживающих в гостинице “Космос” на 23 марта по каждой--
--категории номеров--
SELECT rc.name AS room_category, COUNT(rib.id_room) AS guest_count
FROM dbo.room_in_booking rib
JOIN dbo.room r ON rib.id_room = r.id_room
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
JOIN dbo.room_category rc ON r.id_room_category = rc.id_room_category
WHERE h.name = 'Космос' 
  AND '2024-03-23' BETWEEN rib.checkin_date AND rib.checkout_date
GROUP BY rc.name;

--5. Дать список последних проживавших клиентов по всем комнатам гостиницы--
--“Космос”, выехавшим в апреле с указанием даты выезда.--
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
    WHERE h.name = 'Космос'
      AND rib.checkout_date BETWEEN '2024-04-01' AND '2024-04-30'
)
SELECT id_room, client_name, checkout_date
FROM LastGuests
WHERE rn = 1;

--6. Продлить на 2 дня дату проживания в гостинице “Космос” всем клиентам--
--комнат категории “Бизнес”, которые заселились 10 мая.--
UPDATE rib
SET checkout_date = DATEADD(DAY, 2, checkout_date)
FROM dbo.room_in_booking rib
JOIN dbo.room r ON rib.id_room = r.id_room
JOIN dbo.hotel h ON r.id_hotel = h.id_hotel
JOIN dbo.room_category rc ON r.id_room_category = rc.id_room_category
WHERE h.name = 'Космос'
  AND rc.name = 'Бизнес'
  AND rib.checkin_date = '2025-05-10';

--7. Найти все "пересекающиеся" варианты проживания. Правильное состояние: не--
--может быть забронирован один номер на одну дату несколько раз, т.к. нельзя--
--заселиться нескольким клиентам в один номер. Записи в таблице--
--room_in_booking с id_room_in_booking = 5 и 2154 являются примером--
--неправильного состояния, которые необходимо найти. Результирующий кортеж--
--выборки должен содержать информацию о двух конфликтующих номерах.--
SELECT rib1.id_room_in_booking AS booking_id_1, rib1.id_room, rib1.checkin_date, rib1.checkout_date,
       rib2.id_room_in_booking AS booking_id_2, rib2.id_room, rib2.checkin_date, rib2.checkout_date
FROM dbo.room_in_booking rib1
JOIN dbo.room_in_booking rib2 
    ON rib1.id_room = rib2.id_room  -- Один и тот же номер
    AND rib1.id_room_in_booking <> rib2.id_room_in_booking  -- Исключаем совпадение одной и той же записи
    AND rib1.checkin_date < rib2.checkout_date  -- Пересечение по датам
    AND rib1.checkout_date > rib2.checkin_date  -- Пересечение по датам
--WHERE rib1.id_room_in_booking = 5 OR rib2.id_room_in_booking = 2154
ORDER BY rib1.id_room, rib1.checkin_date;
