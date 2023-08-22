USE codeup_tests_db;

CREATE TABLE suppliers
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    established INT          NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE coffees
(
    id          INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)  NOT NULL,
    roast       VARCHAR(100)  NOT NULL,
    price       DECIMAL(5, 2) NOT NULL,
    supplier_id INT UNSIGNED  NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT coffee_supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);



INSERT INTO suppliers (name, established)
VALUES ('Bean There, Done That Distributors', 1988),
       ('Caffeine Cartel Connections', 2005);

INSERT INTO coffees (name, roast, price, supplier_id)
VALUES ('Hazelnutty Delight', 'medium', 5.99, 2),
       ('Choco-nut Nirvana', 'light', 4.49, 1),
       ('Berry Bonanza Brew', 'dark', 4.99, 1),
       ('Caramel Bliss-presso', 'espresso', 5.99, 1),
       ('Raspberry Rhapsody Roast', 'medium', 5.49, 2),
       ('S\'more Energy Latte', 'light', 4.99, 2)
;


SELECT c.name AS Coffee, c.roast AS Roast, s.name AS Supplier, s.established AS "Established In"
FROM coffees AS c
         JOIN suppliers AS s
              ON c.supplier_id = s.id
ORDER BY c.roast
;



SELECT u.name AS Name, r.name AS Role
FROM users u
         JOIN roles r
              ON u.role_id = r.id
;


SELECT u.name AS Name, r.name AS Role
FROM users u
         LEFT JOIN roles r
                   ON u.role_id = r.id
;



SELECT u.name AS Name, r.name AS Role
FROM users u
         RIGHT JOIN roles r
                    ON u.role_id = r.id
;


SELECT u.name AS Name, r.name AS Role
FROM roles r
         LEFT JOIN users u
                   ON r.id = u.role_id
;



CREATE TABLE shops
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    address VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE coffees_shops
(
    coffee_id INT UNSIGNED NOT NULL,
    shop_id   INT UNSIGNED NOT NULL,
    CONSTRAINT coffees_shops_coffee_id_fk FOREIGN KEY (coffee_id) REFERENCES coffees (id),
    CONSTRAINT coffees_shops_shop_id_fk FOREIGN KEY (shop_id) REFERENCES shops (id)
);


INSERT INTO shops (name, address)
VALUES ('Steve\'s Coffee Spot', '123 Cool Ave'),
       ('Bean Me Up Coffee', '124 Cool Ave');

INSERT INTO coffees_shops (coffee_id, shop_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 1),
       (1, 2),
       (3, 2),
       (6, 2)
;


SELECT c.name AS Coffee, s.name AS Shop
FROM shops s
         JOIN coffees_shops cs
              ON s.id = cs.shop_id
         JOIN coffees c
              ON cs.coffee_id = c.id
;


SELECT c.name AS Coffee, s.name AS Shop
FROM coffees c
         JOIN coffees_shops cs
              ON c.id = cs.coffee_id
         JOIN shops s
              ON cs.shop_id = s.id
;
