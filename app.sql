BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "admins" (
    "id"    INTEGER,
    "username" TEXT,
    "email" TEXT,
    "password"  INTEGER,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "bdetails" (
    "id"    INTEGER,
    "name"  TEXT,
    "telphone"  NUMERIC,
    "address"   TEXT,
    "email" TEXT,
    "room_type" TEXT,
    "number_of_rooms"  int,
    "other_facilities" TEXT,
    "arrival_date" INTEGER,
    "departure_date"   INTEGER,
    "Pricing"  REAL DEFAULT 0,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "factdetails" (
    "name"  TEXT,
    "desc"  TEXT,
    "price" INTEGER,
    "image" BLOB,
    PRIMARY KEY("name")
);
CREATE TABLE IF NOT EXISTS "rdetails" (
    "name"  TEXT,
    "desc"  TEXT,
    "price" INTEGER,
    "image" BLOB,
    PRIMARY KEY("name")
);
CREATE TABLE IF NOT EXISTS "users" (
    "id"    INTEGER,
    "username" TEXT,
    "password" TEXT,
    "email" TEXT,
    "mobileno"  INTEGER,
    PRIMARY KEY("id" AUTOINCREMENT)
);

INSERT INTO "admins" VALUES (1,'admin','admin@gmail.com','admin123');
INSERT INTO "admins" VALUES (2,'','','');
INSERT INTO "bdetails" VALUES (1,'Ali',345738788,'malir cantt,Karachi','ali123@gmail.com','Club Room',1,'on','2025-11-14','2025-11-20',15000.0);
INSERT INTO "bdetails" VALUES (2,'Ahmed',34566877788,'lahore,Pakistan','ahmed12@hotmail.com','Deluxe Room',2,'on','2025-11-23','2023-11-25',12500.0);
INSERT INTO "bdetails" VALUES (3,'Sara',2218638728,'Doha,Qatar','sara@yahoo.com','Deluxe Room',2,'on','2025-11-23','2025-11-26',12300.0);
INSERT INTO "bdetails" VALUES (4,'Naveed',3423333365,'islamabad,Pakistan','naveed09@gmail.com','Club Room',3,'on','2025-11-27','2025-11-28',16000.0);
INSERT INTO "bdetails" VALUES (5,'Rao',2575723653,'Multan,Pakistan','rao234@yahoo.com','Superior Room',2,'on','2025-11-20','2025-11-26',11000.0);
INSERT INTO "bdetails" VALUES (6,'Arsh',2312673567,'Gulshan-e-Iqbal,Karachi','arsh098@hotmail.com','Club Room',1,'on','2025-11-23','2025-11-23',15500.0);
INSERT INTO "bdetails" VALUES (7,'Zaid',3263535372,'lahore,Pakistan','zaid12@gmail.com','Suites',1,'on','2025-11-24','2025-11-27',21000.0);
INSERT INTO "bdetails" VALUES (8,'Christine',3332178788,'London,Uk','christine23@gmail.com','Deluxe Room',1,'on','2025-11-27','2025-11-30',13450.0);
INSERT INTO "bdetails" VALUES (9,'sam',223332163,'California,USA','sam234@hotmail.com','Superior Room',3,'on','2025-12-01','2025-12-05',13500.0);
INSERT INTO "bdetails" VALUES (10,'maya',33213213,'peshawar,Pakistan','maya45@yahoo.com','Superior Room',2,'on','2025-12-02','2025-12-05',13000.0);
INSERT INTO "bdetails" VALUES (11,'Sheikh',2312198238,'nuces karachi','sheikh@gmail.com','Deluxe Room',2,'on','2025-12-07','2025-12-15',17000.0);
INSERT INTO "bdetails" VALUES (12,'Hasan',232126767,'malir','hasan123@gmail.com','Club Room',3,'Event Spaces','12/05/2025','12/07/2025',0.0);

INSERT INTO "factdetails" VALUES ('Unique Dining','Experience authentic, home-style dining at Crescent Pearl Hotel, Karachi. Prepared with a local touch, our wholesome meals let you enjoy healthy, flavorful cuisine. Savor South Asian, Italian, and Chinese PURE-VEGETARIAN dishes during your stay. Download our menu to explore more.',2000,'/static/image/imgd.jpg');
INSERT INTO "factdetails" VALUES ('Private theater','Enjoy movies, TV, sports, and gaming in complete comfort and privacy with our private theatre at Crescent Pearl Hotel, KarachiEnjoy movies, TV, sports, and gaming in complete comfort and privacy with our private theatre at Crescent Pearl Hotel, Karachi',3000,'/static/image/imgpt.jpg');
INSERT INTO "factdetails" VALUES ('Event Spaces','Host weddings, conferences, meetings, and more at Crescent Pearl Hotel, Karachi. Elevate your special day with our iconic, elegant venues.',4000,'/static/image/event space.jpg');
INSERT INTO "factdetails" VALUES ('Aloka Spa','Relax and rejuvenate at Crescent Pearl Hotel, Karachi Spa with Ayurvedic, Full Body, Herbal Wraps, and Mud Mask therapies.',5000,'/static/image/imgspa.jpg');
INSERT INTO "factdetails" VALUES ('Swimming pool','Our swimming pool at Crescent Pearl Hotel, Karachi, is perfect for fun, exercise, and recreation for all ages. We also host pool parties with modern facilities.',3000,'/static/image/imgsp.jpg');
INSERT INTO "factdetails" VALUES ('Cab','We offer a cab service at Crescent Pearl Hotel, Karachi, so you can travel conveniently and enjoy your holidays without the hassle of booking rides.',6000,'/static/image/imgc.jpg');

INSERT INTO "rdetails" VALUES ('Superior ','The Superior rooms at Crescent Pearl Hotel, Karachi, offer a truly luxurious stay to our guests. With a unique blend of elegance and sophistication, these rooms ensure a comfortable and memorable experience. Spanning 378 square feet, each room is designed to take you on a journey of unparalleled comfort and luxury. Extra person and roll-away bed charges apply. Convenience fees applicable on credit card payments.','Starting From Rs 10,000 for one night stay','/static/image/r1.jpg');
INSERT INTO "rdetails" VALUES ('Deluxe ','The Deluxe rooms at Crescent Pearl Hotel, Karachi, offer a delightful stay, whether for leisure or business. Designed to provide guests with every comfort and facility, these rooms ensure an exceptional stay experience. Combining comfort with leisure, Crescent Pearl Hotel is the ideal choice for all travelers. The rooms offer views of the pool or a panoramic perspective of the city. Extra person and roll-away bed charges apply. Convenience fees applicable on credit card payments','Starting from RS 12,000 for one night stay','/static/image/r2.jpg');
INSERT INTO "rdetails" VALUES ('Club ','The Club rooms at Crescent Pearl Hotel, Karachi, are spacious and vibrant. Equipped with all modern amenities, these rooms combine luxury and comfort, making them an ideal choice for business travelers. Featuring elegant décor, they promise an exceptional stay experience. Guests choosing our Club rooms also enjoy complimentary access to the exclusive Crescent Pearl Lounge, along with a host of special inclusions and benefits. Extra person and roll-away bed charges apply. Convenience fees applicable on credit card payments.The Club rooms at Crescent Pearl Hotel, Karachi, are spacious, vibrant, and designed for luxury and comfort, making them perfect for business travelers. Featuring elegant décor, they offer an exceptional stay. Guests also enjoy complimentary access to the exclusive Crescent Pearl Lounge with special benefits. Extra person and roll-away bed charges apply. Convenience fees on credit card payments','Statring From RS 15,000 for one night stay','/static/image/r3.jpg');
INSERT INTO "rdetails" VALUES ('Suites','The Suites at Crescent Pearl Hotel, Karachi, offer luxury and comfort with modern amenities. Spanning 840 sq. ft., each suite features a separate living room and a dedicated lounge for informal meetings with exclusive benefits. Perfect for family vacations or business stays. Convenience fees on credit card payments.','Starting From RS 20,000 for one night stay','/static/image/r4.jpg');

INSERT INTO "users" VALUES (1,'Naveed','naveed123','naveed123@gmail.com',345678932);
INSERT INTO "users" VALUES (2,'Rao','rao123','rao123@gmail.com',234678789);
INSERT INTO "users" VALUES (3,'Arsh','arsh123','arsh123@gmail.com',32125678888);
INSERT INTO "users" VALUES (4,'','','','');
INSERT INTO "users" VALUES (5,'','','','');
INSERT INTO "users" VALUES (6,'','','','');
INSERT INTO "users" VALUES (13,'','','','');
INSERT INTO "users" VALUES (28,'','','','');
INSERT INTO "users" VALUES (30,'','','','');
INSERT INTO "users" VALUES (31,'Arbaz','$2b$12$Nm5pxTULLmt93wWXdAumL.E.KccUp.yPpxeaMJVGvkKFpFEGHRHXi','arbaz123@gmail.com',8309283128);
INSERT INTO "users" VALUES (32,'hasan','$2b$12$kBcH17aIjs4xpz2P/GVKXOJt44nzFIvfwOdEnKWNSIS/2C25KWmR.','hasan23@gmail.com',8309283128);
INSERT INTO "users" VALUES (33,'zaid','$2b$12$1gthbAzKpDLwzPKq5EnVVeujKdKp7FarMm0qBMq4L/rGp4AYCqaWS','zaid@hotmail.com',225454352);
INSERT INTO "users" VALUES (34,'ayan','$2b$12$le1BnYtEw54AfjSWLxj8wuv3.mhrYIPeTaMts8JwLp/OZJjpg2Rn2','ayan@gmail.com',322162561);


CREATE TABLE IF NOT EXISTS "reviews" (
    "review_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "room_type" TEXT,
    "rating" INTEGER CHECK(rating BETWEEN 1 AND 5),
    "review_text" TEXT,
    "review_date" TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO "reviews" (user_id, room_type, rating, review_text, review_date) VALUES
(1, 'Deluxe Room', 5, 'Excellent room, very clean and comfortable.', '2025-12-01'),
(2, 'Superior Room', 4, 'Good experience overall, but room service was slow.', '2025-12-03'),
(3, 'Club Room', 5, 'Loved the lounge access, amazing stay!', '2025-12-05'),
(31, 'Suites', 5, 'Premium experience, worth the price.', '2025-12-08'),
(32, 'Deluxe Room', 3, 'Room was nice but could be cleaner.', '2025-12-10');



CREATE TABLE IF NOT EXISTS "branch" (
    "branch_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "branch_name" TEXT,
    "location" TEXT,
    "contact" TEXT
);

INSERT INTO "branch" (branch_name, location, contact) VALUES
('Crescent Pearl Hotel - Karachi', 'Shahrah-e-Faisal, Karachi', '+92-21-34567890'),
('Crescent Pearl Hotel - Lahore', 'Mall Road, Lahore', '+92-42-98765432'),
('Crescent Pearl Hotel - Islamabad', 'Blue Area, Islamabad', '+92-51-44556677');



CREATE TABLE IF NOT EXISTS "booking_services" (
    "service_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "booking_id" INTEGER,
    "service_name" TEXT,
    "service_price" REAL,
    FOREIGN KEY (booking_id) REFERENCES bdetails(id)
);


INSERT INTO "booking_services" (booking_id, service_name, service_price) VALUES
(1, 'Airport Pickup', 3000),
(1, 'Breakfast Buffet', 1500),
(3, 'Spa Access', 5000),
(5, 'Private Theater Reservation', 3000),
(7, 'Event Space Booking', 8000),
(9, 'Swimming Pool Access', 2000),
(11, 'Cab Service', 2500);


-- Prevent negative or NULL pricing in bdetails
CREATE TRIGGER IF NOT EXISTS prevent_negative_price_before_insert
BEFORE INSERT ON bdetails
FOR EACH ROW
BEGIN
    IF NEW.Pricing IS NULL OR NEW.Pricing < 0 THEN
        SELECT RAISE(ABORT, 'Pricing cannot be NULL or negative');
    END IF;
END;

CREATE TRIGGER IF NOT EXISTS prevent_negative_price_before_update
BEFORE UPDATE ON bdetails
FOR EACH ROW
BEGIN
    IF NEW.Pricing IS NULL OR NEW.Pricing < 0 THEN
        SELECT RAISE(ABORT, 'Pricing cannot be NULL or negative');
    END IF;
END;

-- Auto-set review date if NULL
CREATE TRIGGER IF NOT EXISTS auto_review_date
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    IF NEW.review_date IS NULL OR NEW.review_date = '' THEN
        SET NEW.review_date = DATE('now');
    END IF;
END;

-- Delete services if booking is deleted
CREATE TRIGGER IF NOT EXISTS delete_services_on_booking_delete
AFTER DELETE ON bdetails
FOR EACH ROW
BEGIN
    DELETE FROM booking_services WHERE booking_id = OLD.id;
END;
 

--Trigegr to enforce rating b/w 1-5
CREATE TRIGGER IF NOT EXISTS validate_rating
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    IF NEW.rating < 1 OR NEW.rating > 5 THEN
        SELECT RAISE(ABORT, 'Rating must be between 1 and 5');
    END IF;
END;



COMMIT;
