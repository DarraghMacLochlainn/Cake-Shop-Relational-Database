DROP TABLE someDates;
DROP TABLE suppliers CASCADE CONSTRAINTS;
DROP TABLE ingredientsLists;
DROP TABLE ingredients CASCADE CONSTRAINTS;
DROP TABLE menuItems;
DROP TABLE recipies CASCADE CONSTRAINTS;
DROP TABLE preparedItems CASCADE CONSTRAINTS;
DROP TABLE menus CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE stores CASCADE CONSTRAINTS;

CREATE TABLE stores
(
    postal_code             VARCHAR2(7) PRIMARY KEY,
    name_store              VARCHAR2(30) NOT NULL,
    budget                  NUMBER(10,0) NOT NULL,
    address                 VARCHAR2(50) NOT NULL
);

INSERT INTO stores (postal_code, name_store, budget, address)
VALUES ('x11t333', 'Happy Cakes', 10000, '4 water street, city');
INSERT INTO stores (postal_code, name_store, budget, address)
VALUES ('x11tw33', 'INFINIT CHOCOLATE', 100000, 'number 21, church street, little court, co.city');
INSERT INTO stores (postal_code, name_store, budget, address)
VALUES ('x11t313', 'Foody Stuff', 9000, '1 3rd street, city');
INSERT INTO stores (postal_code, name_store, budget, address)
VALUES ('x11t3g3', 'Ms negamances Cakes Shop', 1000, 'stall 57, city centre, city');
INSERT INTO stores (postal_code, name_store, budget, address)
VALUES ('x11t393', 'Cakes', 10000000, 'corner of 52nd and 3rd street, city');



CREATE TABLE customers
(
    loyaltyCard_ID          VARCHAR2(7) PRIMARY KEY,
    nameCustomers           VARCHAR2(30),
    contactInfo             VARCHAR2(30),  
    favCakes                VARCHAR2(30)
);

ALTER TABLE customers
ADD (postal_code VARCHAR2(7) REFERENCES stores(postal_code));

INSERT INTO customers (loyaltyCard_ID, nameCustomers, contactInfo, favCakes, postal_code)
VALUES ('1234567', 'John Johnson', 'Johnson@email.com', 'Chocolate', 'x11t333');
INSERT INTO customers (loyaltyCard_ID, nameCustomers, contactInfo, favCakes, postal_code)
VALUES ('A4d234G', 'Jack Jackson', '(353)874563456', 'Lemon Drizzle', 'x11tw33');
INSERT INTO customers (loyaltyCard_ID, nameCustomers, contactInfo, favCakes, postal_code)
VALUES ('456E123', 'Abby Ableton', 'abby@email.com', 'Chooclate', 'x11t333');
INSERT INTO customers (loyaltyCard_ID, nameCustomers, contactInfo, favCakes, postal_code)
VALUES ('876543E', 'Chester Chesterfield', 'chester@email.com', 'Ice Cream', 'x11t3g3');
INSERT INTO customers (loyaltyCard_ID, nameCustomers, contactInfo, favCakes, postal_code)
VALUES ('97531DG', 'Richard Dickson', 'richard@email.com', 'Christmas', 'x11t393');

CREATE TABLE employees
(
    employee_ID             VARCHAR2(7) PRIMARY KEY,
    banEmployees            VARCHAR2(22) NOT NULL,
    nameEmployees           VARCHAR2(30) NOT NULL,
    jobTitle                VARCHAR2(15) NOT NULL,
    contactInfo             VARCHAR2(50) NOT NULL,
    salary                  NUMBER(7,2) NOT NULL,
    manager_ID              VARCHAR2(7)
);

ALTER TABLE employees
ADD (postal_code VARCHAR2(7) REFERENCES stores(postal_code));

INSERT INTO employees (employee_ID, banEmployees, nameEmployees, jobTitle, contactInfo, salary, postal_code, manager_ID)
VALUES ('2143657', 'AE342345GH54WE87873452', 'Julia Child', 'Manager', 'julia@email.com', 55000.00, 'x11t333', '1123233');
INSERT INTO employees (employee_ID, banEmployees, nameEmployees, jobTitle, contactInfo,  salary, postal_code, manager_ID)
VALUES ('3579246', '12348765DG45CV78ER2423', 'Greg Ramsey', 'Janitor', 'janitorGreg@email.com', 980.00, 'x11tw33', '0986712');
INSERT INTO employees (employee_ID, banEmployees, nameEmployees, jobTitle, contactInfo,  salary, postal_code, manager_ID)
VALUES ('4826048', 'AD34NB8967578HN009GH73', 'Jack Anton', 'Baker', '+ 171 345 5436', 2300.00, 'x11t333', '2143657');
INSERT INTO employees (employee_ID, banEmployees, nameEmployees, jobTitle, contactInfo, salary, postal_code, manager_ID)
VALUES ('9368241', 'MN24451197AD1245673455', 'James Orchard', 'Cashier', 'apartment 47 ,4th and main, city', 1200.00, 'x11t3g3', '5678567');
INSERT INTO employees (employee_ID, banEmployees, nameEmployees, jobTitle, contactInfo, salary, postal_code, manager_ID)
VALUES ('9874236', '1234567890123456789012', 'Tim Smith', 'Cashier', 'smith@email.com', 1000.00, 'x11t393', '1245233');

CREATE TABLE menus
(
    nameMenus               VARCHAR2(20) PRIMARY KEY,
    allergies               VARCHAR2(30) NOT NULL
);

ALTER TABLE menus
ADD (postal_code VARCHAR2(7) REFERENCES stores(postal_code));

INSERT INTO  menus(nameMenus, allergies, postal_code)
VALUES ('Summer', 'Nuts, Dairy', 'x11t333');
INSERT INTO  menus(nameMenus, allergies, postal_code)
VALUES ('Main', 'Nuts, Wheat, Gluten, Dairy', 'x11tw33');
INSERT INTO  menus(nameMenus, allergies, postal_code)
VALUES ('Cake', 'Nuts, Gluten', 'x11t333');
INSERT INTO  menus(nameMenus, allergies, postal_code)
VALUES ('Birthday', 'Nuts', 'x11t3g3');
INSERT INTO  menus(nameMenus, allergies, postal_code)
VALUES ('Apples', 'Nuts, Shellfish', 'x11t393');

CREATE TABLE preparedItems
(
    namePreparedItems       VARCHAR2(20) PRIMARY KEY,
    amount                 NUMBER(3,0) NOT NULL
);

INSERT INTO  preparedItems(namePreparedItems, amount)
VALUES ('Red Velvet Cupcakes', 56);
INSERT INTO  preparedItems(namePreparedItems, amount)
VALUES ('Chocolate Fudge Cake', 6);
INSERT INTO  preparedItems(namePreparedItems, amount)
VALUES ('Cheese Cake', 4);
INSERT INTO  preparedItems(namePreparedItems, amount)
VALUES ('Battenburg', 19);
INSERT INTO  preparedItems(namePreparedItems, amount)
VALUES ('Apple Pie', 8);

CREATE TABLE recipies
(
    nameRecipies            VARCHAR2(20) PRIMARY KEY,
    descriptionRecipie      VARCHAR2(80)

);

ALTER TABLE recipies
ADD (employee_ID VARCHAR2(7) REFERENCES employees(employee_ID));
ALTER TABLE recipies
ADD (namePreparedItems VARCHAR2(20) REFERENCES preparedItems(namePreparedItems));

INSERT INTO  recipies(nameRecipies, descriptionRecipie, employee_ID, namePreparedItems)
VALUES ('Red Velvet Cupcakes', 'Cupcakes with a chocolate sponge coloured red, with white icing', '2143657', 'Red Velvet Cupcakes');
INSERT INTO  recipies(nameRecipies, descriptionRecipie, employee_ID, namePreparedItems)
VALUES ('Chocolate Fudge Cake', 'A fudge-based chocolate sponge, with chooclate cream and icing', '3579246', 'Chocolate Fudge Cake');
INSERT INTO  recipies(nameRecipies, descriptionRecipie, employee_ID, namePreparedItems)
VALUES ('Cheese Cake', 'A cheese flavoured spong cake', '4826048', 'Cheese Cake');
INSERT INTO  recipies(nameRecipies, descriptionRecipie, employee_ID, namePreparedItems)
VALUES ('Battenburg', '', '9368241', 'Battenburg');
INSERT INTO  recipies(nameRecipies, descriptionRecipie, employee_ID, namePreparedItems)
VALUES ('Apple Pie', 'A pie made with pan-cooked apple slices inside of baked dough', '9874236', 'Apple Pie');

CREATE TABLE menuItems
(
    costMenu                NUMBER(5,2) NOT NULL
);

ALTER TABLE menuItems
ADD (nameMenus VARCHAR2(20) REFERENCES menus(nameMenus));
ALTER TABLE menuItems
ADD (namePreparedItems VARCHAR2(30) REFERENCES preparedItems(namePreparedItems));

INSERT INTO  menuItems(costMenu, nameMenus, namePreparedItems)
VALUES (2.50, 'Summer', 'Red Velvet Cupcakes');
INSERT INTO  menuItems(costMenu, nameMenus, namePreparedItems)
VALUES (25.00, 'Main', 'Chocolate Fudge Cake');
INSERT INTO  menuItems(costMenu, nameMenus, namePreparedItems)
VALUES (20.00, 'Cake', 'Cheese Cake');
INSERT INTO  menuItems(costMenu, nameMenus, namePreparedItems)
VALUES (5.00, 'Birthday', 'Battenburg');
INSERT INTO  menuItems(costMenu, nameMenus, namePreparedItems)
VALUES (12.00, 'Apples', 'Apple Pie');

CREATE TABLE ingredients
(
    barCode                 NUMBER(12,0) PRIMARY KEY,
    nameIngredients         VARCHAR2(20) not null,
    costIngredients         NUMBER(5,2) not null,
    decriptionIngredient    VARCHAR2(30)
    
);

INSERT INTO  ingredients(barCode, nameIngredients, costIngredients, decriptionIngredient)
VALUES (123456789012, 'Caster Sugar', 50.00, 'A 10 kg bag of sugar');
INSERT INTO  ingredients(barCode, nameIngredients, costIngredients, decriptionIngredient)
VALUES (135792468019, 'Flour', 30.00, '6 kg bag of flour');
INSERT INTO  ingredients(barCode, nameIngredients, costIngredients, decriptionIngredient)
VALUES (825395738364, 'Eggs', 25.50, '144 large eggs');
INSERT INTO  ingredients(barCode, nameIngredients, costIngredients, decriptionIngredient)
VALUES (330485755133, 'Icing Sugar', 50.00, 'A 10 kg bag of sugar');
INSERT INTO  ingredients(barCode, nameIngredients, costIngredients, decriptionIngredient)
VALUES (000004473335, 'Margarine', 12.96, '4 kg margarine');

CREATE TABLE ingredientsLists
(
    amount                 NUMBER(4,0) not null
);

ALTER TABLE ingredientsLists
ADD (namePreparedItems VARCHAR2(20) REFERENCES preparedItems(namePreparedItems));
ALTER TABLE ingredientsLists
ADD (barCode NUMBER(12,0) REFERENCES ingredients(barCode));

INSERT INTO  ingredientsLists(amount, namePreparedItems, barCode)
VALUES (59, 'Red Velvet Cupcakes', 123456789012);
INSERT INTO  ingredientsLists(amount, namePreparedItems, barCode)
VALUES (23, 'Chocolate Fudge Cake', 135792468019);
INSERT INTO  ingredientsLists(amount, namePreparedItems, barCode)
VALUES (35, 'Cheese Cake', 825395738364);
INSERT INTO  ingredientsLists(amount, namePreparedItems, barCode)
VALUES (70, 'Battenburg', 330485755133);
INSERT INTO  ingredientsLists(amount, namePreparedItems, barCode)
VALUES (5,  'Apple Pie', 000004473335);

CREATE TABLE suppliers
(
    banSuppliers            VARCHAR2(22) PRIMARY KEY,
    nameSuppliers            VARCHAR2(30) not null,
    contactInfo              VARCHAR2(30) not null
);

INSERT INTO  suppliers(banSuppliers, nameSuppliers, contactInfo)
VALUES ('1234123412341234123412', 'Jeff Goldgum', 'Goldgum@email.com');
INSERT INTO  suppliers(banSuppliers, nameSuppliers, contactInfo)
VALUES ('1414415237869459964686', 'George Macintye', 'GM@eimail.com');
INSERT INTO  suppliers(banSuppliers, nameSuppliers, contactInfo)
VALUES ('34FG7651123FG98O097HF6', 'Mitch Micksaw', 'MicksawMitch@email.com');
INSERT INTO  suppliers(banSuppliers, nameSuppliers, contactInfo)
VALUES ('PO987541123RE56F4D7H88', 'Robert Smith', 'RSmith@email.com');
INSERT INTO  suppliers(banSuppliers, nameSuppliers, contactInfo)
VALUES ('PA56FE45TT7778978T5438', 'Zack smith', '087 343 3494');

CREATE TABLE someDates
(
    occassion               VARCHAR2(15)
);

ALTER TABLE customers
ADD (banSuppliers VARCHAR2(20) REFERENCES suppliers(banSuppliers));
ALTER TABLE customers
ADD (barCode NUMBER(12,0) REFERENCES ingredient(barCode));

INSERT INTO someDates (occassion, banSuppliers, barCode)
VALUES ('Annual', '1234123412341234123412', 123456789012);
INSERT INTO someDates (occassion, banSuppliers, barCode)
VALUES ('Christmas', '1414415237869459964686', 135792468019);
INSERT INTO someDates (occassion, banSuppliers, barCode)
VALUES ('Annual', '34FG7651123FG98O097HF6', 825395738364);
INSERT INTO someDates (occassion, banSuppliers, barCode)
VALUES ('Birthday', 'PO987541123RE56F4D7H88', 330485755133);
INSERT INTO someDates (occassion, banSuppliers, barCode)
VALUES ('Annual', 'PA56FE45TT7778978T5438', 000004473335);


SELECT  postal_code, name_store, budget, address
FROM    store
WHERE   budget <= 20000;

SELECT  loyaltyCard_ID, nameCustomers, contactInfo, favCakes, postal_code
FROM    customers
WHERE   favCakes IN('Chocolate');

SELECT  employee_ID, banEmployees, nameEmployees, jobTitle, contactInfo, salary, postal_code
FROM    employee
WHERE   nameEmployees LIKE '%Smith';

SELECT  nameMenus, allergies, postal_code
FROM    menu
WHERE   allergies LIKE 'Nuts';

SELECT  namePreparedItems, amount
FROM    preparedItems
WHERE   amount <= 25;

SELECT  nameRecipies, descriptionRecipie, employee_ID, namePreparedItems
FROM    recipie
WHERE   nameRecipies = 'Apple Pie';

SELECT  costMenu, nameMenus, namePreparedItems
FROM    menuItems
WHERE   costMenu <= 20.00;

SELECT  barCode, nameIngredients, costIngredients, decriptionIngredient
FROM    ingredient
WHERE   nameIngredients LIKE 'Sugar';

SELECT  amount, barcode, namePreparedItems
FROM    ingredientsLists
WHERE   amount <= 40;

SELECT  banSuppliers, nameSuppliers, contactInfo
FROM    suppliers
WHERE   nameSuppliers LIKE '%SMITH' AND contactInfo LIKE '%@email.com';

SELECT  occassion, banSuppliers, barCode
FROM    someDates
WHERE   occassion =  'Annual';