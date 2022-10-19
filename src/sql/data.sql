use `shinsekai-db`;

-- PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA --
-- PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA --
-- PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA / PRODUCT DATA --

/*  PRODUCTS */
insert into products (id, name, price, discount, description, views, category_id, sale_id) values 
(1, 'Dc - Sakura Fu', 42, 50, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', 217, 2, 4)
(2, 'Saskatoon Berries - Frozen', 128, 50, 'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna', 461, 1, 1)
(3, 'Sole - Iqf', 38, 0, 'mi integer ac neque duis bibendum morbi non quam nec', 382, 5, 4)
(4, 'Syrup - Golden, Lyles', 193, 70, 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante', 65, 5, 3)
(5, 'Muffin Chocolate Individual Wrap', 93, 30, 'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 155, 3, 3)
(6, 'Marjoram - Dried, Rubbed', 119, 70, 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis', 325, 1, 2)
(7, 'Emulsifier', 112, 50, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 246, 5, 2)
(8, 'Veal - Insides Provini', 83, 30, 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat', 181, 4, 5)
(9, 'Veal - Chops, Split, Frenched', 141, 50, 'hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla', 217, 4, 5)
(10, 'Noodles - Cellophane, Thin', 179, 50, 'congue eget semper rutrum nulla nunc purus phasellus in felis donec', 230, 1, 5)
(11, 'Ice Cream Bar - Rolo Cone', 112, 90, 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 400, 5, 4)
(12, 'Nantucket Orange Juice', 166, 70, 'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 43, 4, 1)
(13, 'Wine - Semi Dry Riesling Vineland', 64, 30, 'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit', 50, 5, 2)
(14, 'Mushroom - Enoki, Fresh', 181, 90, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', 16, 2, 3)
(15, 'Oil - Olive Bertolli', 159, 70, 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', 301, 5, 4);

/* productImages */
insert into productImages (id, filename, product_id) values 
(1, '["product-noimg.png", "product-noimg.png"]', 1)
(2, '["oro1.png","oro2.png"]', 2)
(3, '["plata1.png","plata2.png"]', 3)
(4, '["bronce1.png","bronce2.png"]', 4)
(5, '["hierro1.png","hierro2.png"]', 5)
(6, '["product-noimg.png","product-noimg.png"]', 6)
(7, '["bakugo2.png",bakugo1.png"]', 7)
(8, '["img-2.png","img-6.png","img-9.png","img-8.png","img-1.png","img-10.png"]', 8)
(9, '["img-2.png","img-8.png","img-1.png","img-9.png"]', 9)
(10,'["img-1.png","img-4.png","img-7.png","img-8.png","img-3.png","img-9.png","img-6.png"]', 10)
(11,'["img-9.png","img-8.png","img-2.png","img-1.png"]', 11)
(12,'["img-1.png","img-7.png","img-10.png","img-9.png","img-5.png","img-2.png","img-8.png"]', 12)
(13,'["img-9.png","img-1.png","img-6.png","img-4.png"]', 13)
(14,'["img-5.png","img-8.png","img-1.png","img-10.png","img-2.png","img-4.png","img-7.png"]', 14)
(15,'["img-2.png","img-3.png","img-10.png","img-1.png"]', 15);

/* products_availableColors */
insert into products_availableColors (id, product_id, availableColor_id) values
(1, 1, 1)
(2, 1, 2)
(3, 1, 3)
(4, 1, 4)
(5, 1, 5)
(6, 1, 6)
(7, 1, 7)
(8, 1, 8)
(9, 1, 9)
(10, 1, 10)
(11, 1, 11)
(12, 1, 12)
(13, 1, 13)
(14, 1, 14)
(15, 1, 15);

/* availableColors */
insert into available (id, colorName) values 
(1, 'Purple')
(2, 'Red')
(3, 'Puce')
(4, 'Pink')
(5, 'Mauv')
(6, 'Green')
(7, 'Crimson')
(8, 'Goldenrod')
(9, 'Maroon')
(10, 'Purple')
(11, 'Green')
(12, 'Purple')
(13, 'Puce')
(14, 'Teal')
(15, 'Maroon');

/* products_clothesSizes */
insert into products_clothesSizes (id, product_id, clothesSize_id) values
(1, 1, 1)
(2, 1, 2)
(3, 1, 3)
(4, 1, 4)
(5, 1, 5)
(6, 1, 6)
(7, 1, 7)
(8, 1, 8)
(9, 1, 9)
(10, 1, 10)
(11, 1, 11)
(12, 1, 12)
(13, 1, 13)
(14, 1, 14)
(15, 1, 15);

/* metricSizes */
insert into metricSizes (id, amount) values
(1, 1)
(2, 2)
(3, 3)
(4, 4)
(5, 5)
(6, 6)
(7, 7)
(8, 8)
(9, 9)
(10, 10)
(11, 11)
(12, 12)
(13, 13)
(14, 14)
(15, 15);

/* products_metricSize */
insert into products_metricSize (id, product_id, metricSize_id) values
(1, 1, 1)
(2, 1, 2)
(3, 1, 3)
(4, 1, 4)
(5, 1, 5)
(6, 1, 6)
(7, 1, 7)
(8, 1, 8)
(9, 1, 9)
(10, 1, 10)
(11, 1, 11)
(12, 1, 12)
(13, 1, 13)
(14, 1, 14)
(15, 1, 15);

/* categories */
insert into categories (id, name, imageFilename) values
(1, 'Accesorios', 'product.jpg')
(2, 'Ropa', 'product.jpg')
(3, 'Calzado', 'product.jpg')
(4, 'Deportes', 'product.jpg')
(5, 'Electrónica', 'product.jpg')
(6, 'Hogar', 'product.jpg')
(7, 'Juguetes', 'product.jpg')
(8, 'Libros', 'product.jpg')
(9, 'Música', 'product.jpg')
(10, 'Videojuegos', 'product.jpg');

/* sales */
insert into sales (id, name, imageFileName) values
(1, 'Black Friday', 'MICArte.jpg')
(2, 'Cyber Monday', 'MICArte.jpg')
(3, 'Navida', 'MICArte.jpg')
(4, 'Carnaval', 'MICArte.jpg')
(5, 'Dia del padre', 'MICArte.jpg')
(6, 'Dia de la madre', 'MICArte.jpg')
(7, 'Dia del niño', 'MICArte.jpg')
(8, 'Dia del amigo', 'MICArte.jpg')
(9, 'Dia de la mujer', 'MICArte.jpg')
(10, 'Dia de la independencia', 'MICArte.jpg')
(11, 'Dia de la primavera', 'MICArte.jpg')
(12, 'Dia de la patria', 'MICArte.jpg')
(13, 'Dia de la tierra', 'MICArte.jpg')
(14, 'Dia de la juventud', 'MICArte.jpg')
(15, 'Dia de la familia', 'MICArte.jpg');

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