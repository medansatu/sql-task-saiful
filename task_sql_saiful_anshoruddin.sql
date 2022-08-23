CREATE DATABASE QUIZ;

USE QUIZ;

CREATE TABLE [logins] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [customer_id] int UNIQUE NOT NULL,
  [username] varchar(16) UNIQUE NOT NULL,
  [password] varchar(16) NOT NULL
)
GO

CREATE TABLE [customers] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [forename] nvarchar(255) NOT NULL,
  [surname] nvarchar(255),
  [add1] text NOT NULL,
  [add2] text,
  [add3] text,
  [postcode] varchar(10),
  [phone] varchar(20) UNIQUE NOT NULL,
  [email] varchar(255) UNIQUE NOT NULL,
  [registered] bit NOT NULL
)
GO

CREATE TABLE [orders] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [customer_id] int NOT NULL,
  [registered] bit NOT NULL,
  [delivery_add_id] int NOT NULL,
  [payment_type] nvarchar(255) NOT NULL,
  [date] date NOT NULL,
  [status] varchar(8) NOT NULL,
  [total] int NOT NULL
)
GO

CREATE TABLE [order_items] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [order_id] int NOT NULL,
  [product_id] int NOT NULL,
  [quantity] int NOT NULL
)
GO

CREATE TABLE [products] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [cat_id] int NOT NULL,
  [name] varchar(255),
  [description] text,
  [image] varchar(255),
  [price] int NOT NULL
)
GO

CREATE TABLE [categories] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [name] varchar(16) NOT NULL,
  [description] text,
  [image] varchar(255)
)
GO

CREATE TABLE [delivery_address] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [forename] nvarchar(255) NOT NULL,
  [surname] nvarchar(255),
  [add1] text NOT NULL,
  [post_code] varchar(10),
  [phone] varchar(20) NOT NULL,
  [email] varchar(255) NOT NULL
)
GO

CREATE TABLE [admins] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [username] varchar(16) UNIQUE NOT NULL,
  [password] varchar(16) NOT NULL
)
GO

ALTER TABLE [logins] ADD FOREIGN KEY ([customer_id]) REFERENCES [customers] ([id])
GO

ALTER TABLE [orders] ADD FOREIGN KEY ([customer_id]) REFERENCES [customers] ([id])
GO

ALTER TABLE [order_items] ADD FOREIGN KEY ([order_id]) REFERENCES [orders] ([id])
GO

ALTER TABLE [order_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([cat_id]) REFERENCES [categories] ([id])
GO

ALTER TABLE [orders] ADD FOREIGN KEY ([delivery_add_id]) REFERENCES [delivery_address] ([id])
GO

-- Categories Table
INSERT INTO QUIZ.dbo.categories (name,description,[image]) VALUES
	 (N'vegetables',N'daun bayam',N'http://dummyimage.com/bayam.jpg'),
	 (N'vegetables',N'kangkung',N'http://dummyimage.com/kangkung.jpg'),
	 (N'fruits',N'apel malang',N'http://dummyimage.com/apel_malang.jpg'),
	 (N'fruits',N'jeruk bali',N'http://dummyimage.com/jeruk_bali.jpg'),
	 (N'vegetables',N'wortel',N'http://dummyimage.com/wortel.jpg'),
	 (N'vegetables',N'kembang kol',N'http://dummyimage.com/kembang_kol.jpg'),
	 (N'vegetables',N'selada',N'http://dummyimage.com/selada.jpg'),
	 (N'fruits',N'mangga harumanis',N'http://dummyimage.com/mangga_harumanis.jpg');

-- Customers Table
INSERT INTO QUIZ.dbo.customers (forename,surname,add1,add2,add3,postcode,phone,email,registered) VALUES
	 (N'Peggie',N'Pallent',N'Manuk street no.15',NULL,NULL,NULL,N'521-107-9777',N'peggie@mail.com',1),
	 (N'Mathias',N'Folster',N'Cendrawasih street no.18',NULL,NULL,N'56528',N'545-991-1112',N'mathias@mail.com',0),
	 (N'Tamarra',N'Le Merchant',N'Gagak street no17',NULL,NULL,N'551 84',N'808-786-9467',N'tamarra@mail.com',1),
	 (N'Janetta',N'Helin',N'Pipit street no.22',NULL,NULL,NULL,N'686-355-4931',N'janetta@mail.com',1),
	 (N'Reinhold',N'Martijn',N'Emprit street no.55',NULL,NULL,NULL,N'795-679-7139',N'reinhold@mail.com',0),
	 (N'Lauritz',N'Provest',N'Dara street no.98',NULL,NULL,NULL,N'296-351-8061',N'lauritz@mail.com',0),
	 (N'Con',N'Kupisz',N'Merpati street no.10',NULL,NULL,NULL,N'184-411-1830',N'con@mail.com',1),
	 (N'Beatrisa',N'Tomowicz',N'Merak street no.1',NULL,NULL,NULL,N'979-772-1232',N'beatrisa@mail.com',1),
	 (N'Nathanial',N'Rupert',N'Kutilang street no.7',NULL,NULL,N'3025-419',N'636-290-1463',N'nathanial@mail.com',0),
	 (N'Etta',N'Edginton',N'Jalak street no.99',NULL,NULL,N'48100',N'862-845-2560',N'etta@mail.com',1);

-- Delivery Address Table
INSERT INTO QUIZ.dbo.delivery_address (forename,surname,add1,post_code,phone,email) VALUES
	 (N'Harry',N'Blamires',N'5 Northewstern Point',N'K67',N'709-178-2038',N'hblamires@lulu.com'),
	 (N'Adi',N'Carion',N'37136 Macpherson Street',NULL,N'522-462-4973',N'acarlon1@discuz.net'),
	 (N'Barty',N'Monkley',N'55 Hauk Trall',NULL,N'879-792-1014',N'bmonkley@lhg.com'),
	 (N'Salem',N'Ewert',N'81078 Oakridge Circle',NULL,N'223-256-8714',N'sewert3@hostgator.com'),
	 (N'Vilhelmina',N'Bairnsfather',N'72949 Eastwood Street',N'2402',N'632-170-9234',N'vbairnsfather@psu.edu'),
	 (N'Hayyim',N'Lisamore',N'388 Birchwood Place',N'71122',N'901-562-9922',N'hilsamore5@prweb.com'),
	 (N'Mereah',N'Gutans',N'6 Tony Terrace',NULL,N'142-802-2019',N'mgutans6@ucoz.com'),
	 (N'Garret',N'Grayston',N'64394 Clove Place',NULL,N'580-799-7576',N'ggrayston@prweb.com'),
	 (N'Roxine',N'Booler',N'69 Lakewood Gardens Place',N'241551',N'857-659-8653',N'rbooler8@springer.com'),
	 (N'Filbert',N'Brougham',N'8756 Village Green Place',N'5049',N'476-610-5525',N'fbrougham9@sl.edu');

-- Order Items Table
INSERT INTO QUIZ.dbo.order_items (order_id,product_id,quantity) VALUES
	 (4,8,4),
	 (8,10,11),
	 (8,4,11),
	 (1,2,3),
	 (7,9,15),
	 (1,4,13),
	 (10,7,6),
	 (9,10,12),
	 (7,6,11),
	 (6,2,16);

-- Orders Table
INSERT INTO QUIZ.dbo.orders (customer_id,registered,delivery_add_id,payment_type,[date],status,total) VALUES
	 (6,0,2,N'diners-club-us-ca','2019-05-31',N'Paid',182389),
	 (6,1,2,N'jcb','2019-02-24',N'Canceled',385376),
	 (2,0,1,N'mastercard','2019-07-04',N'Canceled',404804),
	 (10,1,5,N'jcb','2019-07-16',N'Canceled',428182),
	 (5,1,3,N'visa-electron','2020-01-13',N'Canceled',370261),
	 (6,1,10,N'americanexpress','2019-10-22',N'Canceled',440665),
	 (3,0,7,N'jcb','2020-01-30',N'Canceled',427954),
	 (6,0,9,N'mastercard','2019-08-30',N'Canceled',250107),
	 (2,0,8,N'jcb','2019-06-03',N'Paid',144049),
	 (5,0,4,N'jcb','2019-08-31',N'Pending',114408);

-- Products Table
INSERT INTO QUIZ.dbo.products (cat_id,description,[image],price,name) VALUES
	 (1,N'Best truffle paste',N'http://dummyimage.com/truffle.jpg',8791,N'Truffle Paste'),
	 (6,N'Grade 1 Carrots',N'http://dummyimage.com/carrots.jpg',9675,N'Carrots - Mini Red Organic'),
	 (4,N'Grande Sprouts',N'http://dummyimage.com/sproutsd.jpg',9147,N'Sprouts Dikon'),
	 (4,N'Healthy Mushroom',N'http://dummyimage.com/mushrooms.jpg',2019,N'Mushrooms - Black, Dried'),
	 (6,N'The Best Coffee in the world',N'http://dummyimage.com/coffee.jpg',5270,N'Coffee - Flavoured'),
	 (8,N'Natural orange juice',N'http://dummyimage.com/orangejuice.jpg',9780,N'Juice - Orange'),
	 (1,N'Healthy energy drinks (lol)',N'http://dummyimage.com/energydrinks.jpg',9676,N'Energy Drinks - Franks Original'),
	 (8,N'Good energy drinks (lol)',N'http://dummyimage.com/energydrinkss.jpg',2916,N'Energy - Boo - Koo'),
	 (4,N'Delicious tart',N'http://dummyimage.com/tartttt.jpg',2099,N'Tart -  Lemon'),
	 (5,N'No.1 Beef tenderloin quality',N'http://dummyimage.com/beef.jpg',6888,N'Stand-alone systematic secured line');

-- Answer No.1
SELECT c.id as customer_id, CONCAT(C.forename,' ', c.surname) as name, O.id as order_id from orders O
LEFT JOIN customers C ON C.id = O.customer_id
ORDER BY customer_id

-- Answer No.2
SELECT COUNT(id) as total_order, status from orders
GROUP BY status

-- Answer No.3
SELECT CT.name as category,  string_agg(P.id, ', ') as product_id, string_agg(P.name, ', ') as product_name from Products P
LEFT JOIN categories CT ON CT.id = P.cat_id 
GROUP BY CT.name
ORDER BY CT.name

-- Answer No.4
SELECT  O.customer_id, O.id as order_id, D.add1 as delivery_address from delivery_address D
RIGHT JOIN orders O on D.id = O.delivery_add_id
ORDER BY customer_id

-- Answer No.5
SELECT O.id as order_id, string_agg(p.name, ', ') as product_name from orders O
INNER JOIN order_items OI on OI.order_id = O.id
INNER JOIN products P on P.id = product_id
GROUP BY O.id
ORDER BY O.id


