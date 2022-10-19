use `shinsekai-db`;

--  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA --
--  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA --
--  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA /  USER DATA --

/* subscriptions */
insert into subscriptions(name, description, price) values 
('Subscripción base', 'Además de contar con un descuento de suscriptor, tendra la opción de leer los comics o mangas de manera online totalmente grátis.', 5),
('La caja (Hierro)', 'Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 4 artículos.', 10),
('La caja (Bronce)', 'Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 6 artículos.', 20),
('La caja (Plata)', 'Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 8 artículos.', 30),
('La caja (Oro)', 'Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 12 artículos.', 40),
('Miembro de honor (Hierro)', 'En esta suscripcion se obtendran "La caja" (Hierro) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.', 12),
('Miembro de honor (Bronce)', 'En esta suscripcion se obtendran "La caja" (Bronce) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.', 18),
('Miembro de honor (Plata)', 'En esta suscripcion se obtendran "La caja" (Plata) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.', 28),
('Miembro de honor (Oro)', 'En esta suscripcion se obtendran "La caja" (Oro) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.', 38);

/* users */
insert into users(username, firstName, lastName, email, password, isAdmin, subscription_id) values 
('Grim', 'Damian', 'Duarte', 'grim@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 5),
('Sai', 'Julián', 'B. Ortega', 'sai@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 5),
('Maga', 'Magali', 'Gayoso', 'maga@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 5),
('Mica', 'Micaela', 'Vizcarra', 'mica@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 5),
('Anto', 'Antonella', 'Pizarro', 'anto@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 5),
('Lula', 'Luján', 'Gutierrez', 'lula@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 5),
('Juan', 'Juan', 'Licciardi', 'juan@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 0, 2),
('Diego', 'Diego', 'Montes', 'diego@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 0, 2),
('Eric', 'Eric', 'Mena', 'eric@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 8),
('Juli', 'Julián', 'Aquino', 'juli@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 1, 8),
('otaku1', 'Nutenno', 'Naada', 'otaku1@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 0, 2),
('otaku2', 'Mekero', 'Mori', 'otaku2@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 0, 2),
('rolero1', 'Villero blanco', 'De ojotas azules', 'rolero1@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 0, 1),
('rolero2', 'Manco', 'Oscuro', 'rolero2@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 0, 1),
('MiniEric', 'Eric', 'Mini', 'minieric@gmail.com', '$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6', 0, 3);

/* linkedAccounts */
insert into linkedAccounts(name, auth, user_id) values 
('MercadoPago', 'nusequeponeraquí', 1),
('MercadoPago', 'nusequeponeraquí', 2),
('MercadoPago', 'nusequeponeraquí', 3),
('MercadoPago', 'nusequeponeraquí', 4),
('MercadoPago', 'nusequeponeraquí', 5),
('MercadoPago', 'nusequeponeraquí', 6),
('MercadoPago', 'nusequeponeraquí', 7),
('MercadoPago', 'nusequeponeraquí', 8),
('MercadoPago', 'nusequeponeraquí', 9),
('MercadoPago', 'nusequeponeraquí', 10),
('MercadoPago', 'nusequeponeraquí', 11),
('MercadoPago', 'nusequeponeraquí', 12),
('MercadoPago', 'nusequeponeraquí', 13),
('MercadoPago', 'nusequeponeraquí', 14),
('MercadoPago', 'nusequeponeraquí', 15);

/* userImages */
insert into userImages(filename, user_id) values 
('AvatarDefault.jpeg', 1),
('AvatarDefault.jpeg', 2),
('AvatarDefault.jpeg', 3),
('AvatarDefault.jpeg', 4),
('AvatarDefault.jpeg', 5),
('AvatarDefault.jpeg', 6),
('AvatarDefault.jpeg', 7),
('AvatarDefault.jpeg', 8),
('AvatarDefault.jpeg', 9),
('AvatarDefault.jpeg', 10),
('AvatarDefault.jpeg', 11),
('AvatarDefault.jpeg', 12),
('AvatarDefault.jpeg', 13),
('AvatarDefault.jpeg', 14),
('AvatarDefault.jpeg', 15);

-- PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA --
-- PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA --
-- PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA --

/* categories */
insert into categories (name, imageFilename) values
('Accesorios', 'product.jpg'),
('Ropa', 'product.jpg'),
('Calzado', 'product.jpg'),
('Deportes', 'product.jpg'),
('Electrónica', 'product.jpg'),
('Hogar', 'product.jpg'),
('Juguetes', 'product.jpg'),
('Libros', 'product.jpg'),
('Música', 'product.jpg'),
('Videojuegos', 'product.jpg');

/* sales */
insert into sales (name, imageFileName) values
('Black Friday', 'MICArte.jpg'),
('Cyber Monday', 'MICArte.jpg'),
('Navidá', 'MICArte.jpg'),
('Carnaval', 'MICArte.jpg'),
('Dia del padre', 'MICArte.jpg'),
('Dia de la madre', 'MICArte.jpg'),
('Dia del niño', 'MICArte.jpg'),
('Dia del amigo', 'MICArte.jpg'),
('Dia de la mujer', 'MICArte.jpg'),
('Dia de la independencia', 'MICArte.jpg'),
('Dia de la primavera', 'MICArte.jpg'),
('Dia de la patria', 'MICArte.jpg'),
('Dia de la tierra', 'MICArte.jpg'),
('Dia de la juventud', 'MICArte.jpg'),
('Dia de la familia', 'MICArte.jpg');

/*  products */
insert into products (name, price, discount, description, views, category_id, sale_id) values 
('Dc - Sakura Fu', 42, 50, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', 217, 2, 4),
('Saskatoon Berries - Frozen', 128, 50, 'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna', 461, 1, 1),
('Sole - Iqf', 38, 0, 'mi integer ac neque duis bibendum morbi non quam nec', 382, 5, 4),
('Syrup - Golden, Lyles', 193, 70, 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante', 65, 5, 3),
('Muffin Chocolate Individual Wrap', 93, 30, 'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 155, 3, 3),
('Marjoram - Dried, Rubbed', 119, 70, 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis', 325, 1, 2),
('Emulsifier', 112, 50, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 246, 5, 2),
('Veal - Insides Provini', 83, 30, 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat', 181, 4, 5),
('Veal - Chops, Split, Frenched', 141, 50, 'hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla', 217, 4, 5),
('Noodles - Cellophane, Thin', 179, 50, 'congue eget semper rutrum nulla nunc purus phasellus in felis donec', 230, 1, 5),
('Ice Cream Bar - Rolo Cone', 112, 90, 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 400, 5, 4),
('Nantucket Orange Juice', 166, 70, 'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 43, 4, 1),
('Wine - Semi Dry Riesling Vineland', 64, 30, 'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit', 50, 5, 2),
('Mushroom - Enoki, Fresh', 181, 90, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', 16, 2, 3),
('Oil - Olive Bertolli', 159, 70, 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', 301, 5, 4);

/* productImages */
insert into productImages (filename, product_id) values 
('product-noimg.png', 1),
('product-noimg.png', 1),
('oro1.png', 2),
('oro2.png', 2),
('plata1.png', 3),
('plata2.png', 3),
('bronce1.png', 4),
('bronce2.png', 4),
('hierro1.png', 5),
('hierro2.png', 5),
('product-noimg.png', 6),
('product-noimg.png', 6),
('bakugo2.png', 7),
('bakugo1.png', 7),
('img-1.png', 8),
('img-2.png', 8),
('img-3.png', 9),
('img-4.png', 9),
('img-5.png', 10),
('img-6.png', 10),
('img-7.png', 11),
('img-8.png', 11),
('img-9.png', 12),
('img-10.png', 12),
('img-11.png', 13),
('img-12.png', 13),
('img-13.png', 14),
('img-14.png', 14),
('img-15.png', 15),
('img-16.png', 15);

/* availableColors */
insert into availableColors (colorName) values 
('Purple'),
('Red'),
('Puke'),
('Pink'),
('Mauv'),
('Green'),
('Crimson'),
('Goldenrod'),
('Maroon'),
('Purple'),
('Green'),
('Purple'),
('Puce'),
('Teal'),
('Maroon');

/* clothesSizes*/
insert into clothesSizes (name) values
('3XL'),
('XXL'),
('XL'),
('L'),
('M'),
('S');

/* metricSizes */
insert into metricSizes (amount) values
(12),
(26),
(38),
(44),
(53),
(61),
(127),
(68),
(29),
(310),
(411),
(112),
(13),
(45),
(55);

/* products_availableColors */
insert into products_availableColors (product_id, availableColor_id) values
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15);

/* products_clothesSizes */
insert into products_clothesSizes (product_id, clothesSize_id) values
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 3);

/* products_metricSize */
insert into products_metricSizes (product_id, metricSize_id) values
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 13),
(5, 14),
(5, 15);

-- USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA --
-- USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA --
-- USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA / USER-PRODUCT DATA --

/* productComments */
insert into productComments (content, user_id, product_id) values 
('eget elit sodales scelerisque mauris sit amet', 5, 3),
('pellentesque quisque porta volutpat erat quisque erat eros viverra', 4, 2),
('condimentum neque sapien placerat ante nulla', 2, 4),
('curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor', 1, 1),
('elementum ligula vehicula consequat morbi a ipsum integer a', 4, 1),
('duis bibendum morbi non quam nec dui luctus rutrum nulla', 3, 4),
('venenatis turpis enim blandit mi in porttitor', 3, 2),
('velit vivamus vel nulla eget eros elementum', 3, 3),
('ipsum primis in faucibus orci luctus et', 1, 1),
('diego gay', 3, 4),
('maecenas rhoncus aliquam lacus morbi quis tortor id nulla', 1, 1),
('turpis elementum ligula vehicula consequat morbi a ipsum integer a', 4, 1),
('quisque ut erat curabitur gravida', 1, 1),
('in sagittis dui vel nisl', 4, 2),
('sed ante vivamus tortor duis mattis egestas metus aenean', 1, 3),
('suspendisse potenti in eleifend quam', 3, 5),
('accumsan tortor quis turpis sed ante vivamus tortor duis mattis', 4, 5),
('justo in blandit ultrices', 4, 2),
('donec pharetra magna vestibulum aliquet ultrices erat tortor', 3, 2),
('adipiscing molestie hendrerit at vulputate vitae nisl aenean', 2, 5),
('sodales sed tincidunt eu felis fusce posuere', 1, 5),
('nullam orci pede venenatis non sodales', 2, 2),
('interdum in ante', 1, 4),
('ut volutpat sapien arcu sed augue aliquam erat volutpat', 5, 2),
('justo morbi ut odio cras mi', 4, 2),
('tristique fusce congue diam', 2, 5),
('eget massa tempor convallis nulla neque libero', 4, 2),
('integer ac neque duis bibendum morbi non', 1, 5),
('eleifend pede libero quis orci', 1, 4),
('at velit eu', 2, 1),
('maecenas leo odio condimentum id luctus nec', 4, 2),
('elit proin risus praesent lectus vestibulum', 5, 3),
('erat quisque erat eros viverra eget', 2, 5),
('porttitor lacus at turpis', 5, 5),
('ut dolor morbi vel lectus in', 4, 4),
('amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus', 4, 5),
('vitae consectetuer eget rutrum at lorem integer tincidunt ante vel', 4, 4),
('in congue etiam justo', 3, 4),
('lacinia sapien quis libero nullam sit amet turpis elementum', 5, 1),
('leo odio condimentum id', 3, 3),
('at nunc commodo', 5, 1),
('sit amet eleifend pede libero quis orci', 3, 2),
('rutrum nulla tellus in sagittis dui vel nisl duis', 5, 2),
('sit amet eros suspendisse accumsan', 1, 3),
('diam cras pellentesque volutpat dui', 5, 5);

/* productReviews */
insert into productReviews (points, content, karma, user_id, product_id) values 
(1, 'curae mauris viverra diam vitae quam', 19, 3, 3),
(4, 'vulputate nonummy maecenas tincidunt lacus at velit vivamus', -23, 5, 2),
(10, 'pulvinar nulla pede ullamcorper augue a suscipit nulla elit', 25, 4, 2),
(2, 'eu interdum eu tincidunt in leo maecenas', 21, 5, 3),
(7, 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', -13, 5, 1),
(2, 'ac tellus semper interdum', -6, 1, 4),
(9, 'sociis natoque penatibus et magnis dis parturient montes', -8, 4, 4),
(6, 'penatibus et magnis dis parturient', -3, 3, 2),
(3, 'sagittis sapien cum sociis natoque penatibus et', 12, 2, 4),
(7, 'convallis eget eleifend luctus ultricies eu nibh quisque', 3, 4, 1),
(8, 'ante vestibulum ante ipsum primis in faucibus orci luctus et', -10, 3, 4),
(8, 'feugiat non pretium quis lectus suspendisse', 5, 4, 2),
(10, 'erat vestibulum sed', 0, 4, 3),
(4, 'justo in blandit ultrices enim lorem ipsum dolor sit amet', -24, 1, 2),
(5, 'ante vestibulum ante ipsum primis in faucibus orci luctus et', -3, 1, 4),
(10, 'vel accumsan tellus nisi eu orci', -3, 5, 1),
(6, 'eu interdum eu tincidunt in leo maecenas pulvinar lobortis est', -7, 3, 5),
(7, 'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', -6, 1, 1),
(3, 'faucibus accumsan odio curabitur convallis duis consequat dui', -5, 5, 1),
(1, 'ac leo pellentesque ultrices mattis odio donec vitae', -6, 4, 3),
(6, 'in quis justo', -22, 4, 2),
(5, 'enim blandit mi in porttitor pede justo', -8, 1, 2),
(5, 'consequat morbi a ipsum integer a nibh in quis', 16, 5, 1),
(6, 'ipsum dolor sit amet consectetuer adipiscing elit', 8, 4, 2),
(6, 'nisi venenatis tristique fusce congue', 17, 5, 4),
(1, 'consectetuer adipiscing elit proin', 6, 1, 1),
(6, 'congue diam id ornare imperdiet sapien urna', 16, 3, 2),
(3, 'sapien cursus vestibulum proin', 18, 4, 1),
(4, 'ut tellus nulla ut erat id mauris vulputate elementum', -24, 5, 5),
(7, 'mattis pulvinar nulla pede ullamcorper augue', 6, 4, 4),
(3, 'nec molestie sed justo pellentesque viverra', -14, 3, 5),
(2, 'tellus in sagittis', -7, 5, 5),
(3, 'orci mauris lacinia sapien quis', -11, 2, 5),
(1, 'vitae ipsum aliquam non mauris morbi non', 2, 4, 4),
(5, 'purus eu magna vulputate luctus cum sociis', 20, 4, 2),
(10, 'eget massa tempor convallis nulla neque libero convallis', -21, 2, 5),
(8, 'id ligula suspendisse ornare consequat lectus in est risus auctor', 15, 2, 1),
(4, 'justo maecenas rhoncus aliquam lacus morbi', -24, 2, 1),
(3, 'ac enim in tempor turpis nec euismod', 7, 1, 1),
(1, 'pede libero quis', 22, 2, 4),
(6, 'faucibus orci luctus et ultrices posuere cubilia curae donec', 0, 5, 2),
(10, 'erat curabitur gravida nisi at nibh in hac habitasse platea', -5, 1, 2),
(1, 'suscipit a feugiat et eros', -2, 5, 2),
(3, 'erat id mauris vulputate elementum nullam varius nulla facilisi cras', -24, 2, 2),
(2, 'in ante vestibulum ante ipsum primis in faucibus orci luctus', -22, 5, 4);

/* tags */
insert into tags (name, imageFilename) values 
('in blandit', 'tag1.png'),
('ratt', 'tag2.png'),
('niggrem', 'tag3.png'),
('diegum gae', 'tag4.png'),
('etiam justo', 'tag5.png'),
('cursus id', 'tag6.png'),
('nibbha', null),
('vivamus', 'tag8.png'),
('orci eget', 'tag9.png'),
('tortor', 'tag10.png'),
('cum', 'tag11.png'),
('nunc', 'tag12.png'),
('aliquam', 'tag13.png'),
('mhni herik', 'tag14.png'),
('varius ut', 'tag15.png');

/* purchasedHistories */
insert into purchasedHistories (user_id) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

/* purchaseOrders */
insert into purchaseOrders (user_id) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

/* viewedHistories */
insert into viewedHistories (user_id) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

/* wishLists */
insert into wishLists (user_id) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

/* wishLists_products */
insert into wishLists_products (wishList_id, product_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

/* viewedHistories_products */
insert into viewedHistories_products (viewedHistory_id, product_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

/* purchasedHistories_products */
insert into purchasedHistories_products (purchasedHistory_id, product_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

/* purchaseOrders_products */
insert into purchaseOrders_products (purchaseOrder_id, product_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

/* tags_users */
insert into tags_users (tag_id, user_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

/* tags_products */
insert into tags_products (tag_id, product_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);