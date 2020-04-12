INSERT INTO Categoties(title, alias)
values 
    ('Доски и лыжи', 'boards'),
    ('Крепления', 'attachment'),
    ('Ботинки', 'boots'),
    ('Одежда', 'clothing'),
    ('Инструменты', 'tools'),
    ('Разное', 'other');

INSERT INTO users(email, name, password)
values
    ('volod9@gmail.com', 'Володя', 'volod9navsegda'),
    ('ignat1337@mail.ru', 'Игнат', 'qwerty'),
    ('naruto@inbox.ru', 'Наруто', 'saskevernisvkanohu');
			
INSERT INTO lots(date_create, name,opisanie,img_lots, first_price, date_end, steps_lots, id_autor, id_winner, id_cat, lot_price)
values 
    ('2020-03-27 00:00:00', '2014 Rossingnol District Snowboard', 'Описание временно отсутствует', 'img/lot-1.jpg',10999,'2020-03-28 00:00:00',500,2,2,1, 10999),
	('2020-03-27 00:00:00','DC Ply Mens 2016/2017 Snowboard', 'Легкий маневренный сноуборд, готовый дать жару в любом парке, растопив снег мощным щелчкоми четкими дугами. ', 'img/lot-2.jpg',159999,'2020-03-28 00:00:00',500,2,2,1, 159999),
	('2020-03-25 00:00:00','Крепления Union Contact Pro 2015 года размер L/XL', 'Описание временно отсутствует', 'img/lot-3.jpg',8000,'2020-03-28 00:00:00',500,1,1,2, 8000),
	('2020-03-27 00:00:00','Ботинки для сноуборда DC Mutiny Charocal', 'Описание временно отсутствует', 'img/lot-4.jpg',10999,'2020-03-28 00:00:00',500,1,1,3, 10999),
	('2020-03-25 00:00:00','Куртка для сноуборда DC Mutiny Charocal', 'Описание временно отсутствует', 'img/lot-5.jpg',7500,'2020-03-26 00:00:00',500,1,1,4, 7500),
	('2020-03-27 00:00:00','Маска Oakley Canopy', 'Описание временно отсутствует', 'img/lot-6.jpg',5400,'2020-03-28 00:00:00',500,3,3,6, 5400);
	
INSERT INTO bets(date_bet, price, id_user, id_lots)
values
    ('2020-03-27 10:00:00','8600', '2', '3'),
    ('2020-03-27 10:00:00','9400', '3', '3');
	
	
	/*обновление ставки в таблице lots (на будущее)*/
UPDATE lots
inner join bets on lots.id_lots=bets.id_lots
set lots.lot_price=bets.price
where bets.price=(select max(price)from bets);
	
	/*получить все категории;*/
SELECT title from Categoties;
/*получить самые новые, открытые лоты*/
SELECT * FROM lots WHERE date_end>NOW() AND date_create>=SUBDATE(NOW(), 1);
/*показать лот по его id.*/
SELECT *, title FROM lots INNER JOIN Categoties
ON lots.id_cat=Categoties.id_cat
WHERE id_lots=2;
/*обновить название лота по его идентификатору*/
UPDATE lots SET name='Изменение' WHERE lots_id=2;
UPDATE lots SET name='DC Ply Mens 2016/2017 Snowboard' WHERE lots_id=2;
/*получить список самых свежих ставок для лота по его идентификатору*/
SELECT * FROM bets WHERE date_bet>=SUBDATE(NOW(), 1) and id_lots=3;




