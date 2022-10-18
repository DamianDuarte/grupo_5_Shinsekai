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





