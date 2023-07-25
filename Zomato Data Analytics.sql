CREATE DATABASE ZOMATO;
DROP DATABASE ZOMATO;

CREATE TABLE Users
(
    user_id	INT PRIMARY KEY,
    name	VARCHAR(512) NOT NULL,
    email	VARCHAR(512),
    password	VARCHAR(512)
);

INSERT INTO Users (user_id, name, email, password) VALUES ('1', 'Nitish', 'nitish@gmail.com', 'p252h');
INSERT INTO Users (user_id, name, email, password) VALUES ('2', 'Khushboo', 'khushboo@gmail.com', 'hxn9b');
INSERT INTO Users (user_id, name, email, password) VALUES ('3', 'Vartika', 'vartika@gmail.com', '9hu7j');
INSERT INTO Users (user_id, name, email, password) VALUES ('4', 'Ankit', 'ankit@gmail.com', 'lkko3');
INSERT INTO Users (user_id, name, email, password) VALUES ('5', 'Neha', 'neha@gmail.com', '3i7qm');
INSERT INTO Users (user_id, name, email, password) VALUES ('6', 'Anupama', 'anupama@gmail.com', '46rdw2');
INSERT INTO Users (user_id, name, email, password) VALUES ('7', 'Rishabh', 'rishabh@gmail.com', '4sw123');

CREATE TABLE restaurant 
(
    r_id	INT PRIMARY KEY,
    r_name	VARCHAR(512) NOT NULL,
    cuisine	VARCHAR(512)
);

INSERT INTO restaurant (r_id, r_name, cuisine) VALUES ('1', 'dominos', 'Italian');
INSERT INTO restaurant (r_id, r_name, cuisine) VALUES ('2', 'kfc', 'American');
INSERT INTO restaurant (r_id, r_name, cuisine) VALUES ('3', 'box8', 'North Indian');
INSERT INTO restaurant (r_id, r_name, cuisine) VALUES ('4', 'Dosa Plaza', 'South Indian');
INSERT INTO restaurant (r_id, r_name, cuisine) VALUES ('5', 'China Town', 'Chinese');

CREATE TABLE Food 
(
    f_id	INT PRIMARY KEY,
    f_name	VARCHAR(512) NOT NULL,
    type	VARCHAR(512)
);

INSERT INTO Food (f_id, f_name, type) VALUES ('1', 'Non-veg Pizza', 'Non-veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('2', 'Veg Pizza', 'Veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('3', 'Choco Lava cake', 'Veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('4', 'Chicken Wings', 'Non-veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('5', 'Chicken Popcorn', 'Non-veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('6', 'Rice Meal', 'Veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('7', 'Roti meal', 'Veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('8', 'Masala Dosa', 'Veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('9', 'Rava Idli', 'Veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('10', 'Schezwan Noodles', 'Veg');
INSERT INTO Food (f_id, f_name, type) VALUES ('11', 'Veg Manchurian', 'Veg');


CREATE TABLE Menu 
(
    menu_id	INT PRIMARY KEY ,
    r_id	INT NOT NULL,
    f_id	INT NOT NULL,
    price	INT
);

INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('1', '1', '1', '450');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('2', '1', '2', '400');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('3', '1', '3', '100');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('4', '2', '3', '115');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('5', '2', '4', '230');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('6', '2', '5', '300');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('7', '3', '3', '80');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('8', '3', '6', '160');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('9', '3', '7', '140');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('10', '4', '6', '230');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('11', '4', '8', '180');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('12', '4', '9', '120');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('13', '5', '6', '250');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('14', '5', '10', '220');
INSERT INTO Menu (menu_id, r_id, f_id, price) VALUES ('15', '5', '11', '180');

CREATE TABLE Orders 
(
    order_id	INT PRIMARY KEY,
    user_id	INT NOT NULL,
    r_id	INT NOT NULL,
    amount	INT NOT NULL,
    date	VARCHAR(512) NOT NULL,
    partner_id	INT,
    delivery_time	INT,
    delivery_rating	INT,
    restaurant_rating	VARCHAR(512)
);

INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1001', '1', '1', '550', '2022-05-10', '1', '25', '5', '3');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1002', '1', '2', '415', '2022-05-26', '1', '19', '5', '2');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1003', '1', '3', '240', '2022-06-15', '5', '29', '4', '');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1004', '1', '3', '240', '2022-06-29', '4', '42', '3', '5');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1005', '1', '3', '220', '2022-07-10', '1', '58', '1', '4');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1006', '2', '1', '950', '2022-06-10', '2', '16', '5', '');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1007', '2', '2', '530', '2022-06-23', '3', '60', '1', '5');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1008', '2', '3', '240', '2022-07-07', '5', '33', '4', '5');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1009', '2', '4', '300', '2022-07-17', '4', '41', '1', '');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1010', '2', '5', '650', '2022-07-31', '1', '67', '1', '4');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1011', '3', '1', '450', '2022-05-10', '2', '25', '3', '1');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1012', '3', '4', '180', '2022-05-20', '5', '33', '4', '1');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1013', '3', '2', '230', '2022-05-30', '4', '45', '3', '');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1014', '3', '2', '230', '2022-06-11', '2', '55', '1', '2');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1015', '3', '2', '230', '2022-06-22', '3', '21', '5', '');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1016', '4', '4', '300', '2022-05-15', '3', '31', '5', '5');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1017', '4', '4', '300', '2022-05-30', '1', '50', '1', '');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1018', '4', '4', '400', '2022-06-15', '2', '40', '3', '5');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1019', '4', '5', '400', '2022-06-30', '1', '70', '2', '4');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1020', '4', '5', '400', '2022-07-15', '3', '26', '5', '3');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1021', '5', '1', '550', '2022-07-01', '5', '22', '2', '');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1022', '5', '1', '550', '2022-07-08', '1', '34', '5', '1');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1023', '5', '2', '645', '2022-07-15', '4', '38', '5', '1');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1024', '5', '2', '645', '2022-07-21', '2', '58', '2', '1');
INSERT INTO Orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES ('1025', '5', '2', '645', '2022-07-28', '2', '44', '4', '');

CREATE TABLE delivery_partners 
(
    partner_id	INT PRIMARY KEY,
    partner_name	VARCHAR(512) NOT NULL
);

INSERT INTO delivery_partners (partner_id, partner_name) VALUES ('1', 'Suresh');
INSERT INTO delivery_partners (partner_id, partner_name) VALUES ('2', 'Amit');
INSERT INTO delivery_partners (partner_id, partner_name) VALUES ('3', 'Lokesh');
INSERT INTO delivery_partners (partner_id, partner_name) VALUES ('4', 'Kartik');
INSERT INTO delivery_partners (partner_id, partner_name) VALUES ('5', 'Gyandeep');

CREATE TABLE order_details 
(
    id	INT PRIMARY KEY,
    order_id	INT NOT NULL,
    f_id	INT NOT NULL
);

INSERT INTO order_details (id, order_id, f_id) VALUES ('1', '1001', '1');
INSERT INTO order_details (id, order_id, f_id) VALUES ('2', '1001', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('3', '1002', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('4', '1002', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('5', '1003', '6');
INSERT INTO order_details (id, order_id, f_id) VALUES ('6', '1003', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('7', '1004', '6');
INSERT INTO order_details (id, order_id, f_id) VALUES ('8', '1004', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('9', '1005', '7');
INSERT INTO order_details (id, order_id, f_id) VALUES ('10', '1005', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('11', '1006', '1');
INSERT INTO order_details (id, order_id, f_id) VALUES ('12', '1006', '2');
INSERT INTO order_details (id, order_id, f_id) VALUES ('13', '1006', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('14', '1007', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('15', '1007', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('16', '1008', '6');
INSERT INTO order_details (id, order_id, f_id) VALUES ('17', '1008', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('18', '1009', '8');
INSERT INTO order_details (id, order_id, f_id) VALUES ('19', '1009', '9');
INSERT INTO order_details (id, order_id, f_id) VALUES ('20', '1010', '10');
INSERT INTO order_details (id, order_id, f_id) VALUES ('21', '1010', '11');
INSERT INTO order_details (id, order_id, f_id) VALUES ('22', '1010', '6');
INSERT INTO order_details (id, order_id, f_id) VALUES ('23', '1011', '1');
INSERT INTO order_details (id, order_id, f_id) VALUES ('24', '1012', '8');
INSERT INTO order_details (id, order_id, f_id) VALUES ('25', '1013', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('26', '1014', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('27', '1015', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('28', '1016', '8');
INSERT INTO order_details (id, order_id, f_id) VALUES ('29', '1016', '9');
INSERT INTO order_details (id, order_id, f_id) VALUES ('30', '1017', '8');
INSERT INTO order_details (id, order_id, f_id) VALUES ('31', '1017', '9');
INSERT INTO order_details (id, order_id, f_id) VALUES ('32', '1018', '10');
INSERT INTO order_details (id, order_id, f_id) VALUES ('33', '1018', '11');
INSERT INTO order_details (id, order_id, f_id) VALUES ('34', '1019', '10');
INSERT INTO order_details (id, order_id, f_id) VALUES ('35', '1019', '11');
INSERT INTO order_details (id, order_id, f_id) VALUES ('36', '1020', '10');
INSERT INTO order_details (id, order_id, f_id) VALUES ('37', '1020', '11');
INSERT INTO order_details (id, order_id, f_id) VALUES ('38', '1021', '1');
INSERT INTO order_details (id, order_id, f_id) VALUES ('39', '1021', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('40', '1022', '1');
INSERT INTO order_details (id, order_id, f_id) VALUES ('41', '1022', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('42', '1023', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('43', '1023', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('44', '1023', '5');
INSERT INTO order_details (id, order_id, f_id) VALUES ('45', '1024', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('46', '1024', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('47', '1024', '5');
INSERT INTO order_details (id, order_id, f_id) VALUES ('48', '1025', '3');
INSERT INTO order_details (id, order_id, f_id) VALUES ('49', '1025', '4');
INSERT INTO order_details (id, order_id, f_id) VALUES ('50', '1025', '5');



