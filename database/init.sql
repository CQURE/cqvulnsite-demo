USE cq;

CREATE OR REPLACE TABLE users (
    user_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email varchar(50) NOT NULL,
    password varchar(150) NOT NULL,
    isAdmin boolean NOT NULL DEFAULT false,
    username varchar(50) NOT NULL,
    fullName varchar(50),
    title varchar(50),
    phone varchar(50),
    skillsDescription varchar(200),
    socialSecurityNumber varchar(200),
    wallet float,
    loginAttempts int NOT NULL DEFAULT 0
  );

  INSERT INTO users (email, password, isAdmin, username, fullName, title, phone, skillsDescription, socialSecurityNumber, wallet) VALUES
      -- $2a$12$ID2plo9wq/shHnGhs.kTG.ImaKIbvgFGv67sUmDURTlY.Pj3y4PM. = P@ssw0rd
      ('student@cqureacademy.com', '$2a$12$ID2plo9wq/shHnGhs.kTG.ImaKIbvgFGv67sUmDURTlY.Pj3y4PM.', false, 'student','Clever Johnny','Trash Can Expert','001 123 321 123','Investigation, collecting
','12343234223234','10.00'),
      ('admin@cqureacademy.com', '$2a$12$ID2plo9wq/shHnGhs.kTG.ImaKIbvgFGv67sUmDURTlY.Pj3y4PM.', true, 'admin','Jack the Admin','System Administrator','001 322 312 123','Investigation, collecting
, administration','45354353243234','200.00'),

      -- $2a$12$WLF1mB1oL67cpRD9qLKP4.mr1MGPPOivN4UsGbcotmCyBP4am6lru = science
      ('ryland.grace@cqureacademy.com', '$2a$12$WLF1mB1oL67cpRD9qLKP4.mr1MGPPOivN4UsGbcotmCyBP4am6lru', false, 'ryland.grace','Ryland Grace','Trash Can Specialist','001 333 312 123','Analysis, ru
nning','3453323423434','300.00'),

      -- $2a$12$s/GJRBEDx/XfiSZwmrnWwulzN/vq6yguYPgmnOZFr6PmirEzqaHqe = p0wer!!!
      ('eva.stratt@cqureacademy.com', '$2a$12$s/GJRBEDx/XfiSZwmrnWwulzN/vq6yguYPgmnOZFr6PmirEzqaHqe', true, 'eva.stratt','Eva Stratt','Junior Trash Can Specialist','001 343 312 334','Investigatio
n, administration','666776787687','100.00'),

      -- $2a$12$nj7Z0xOWJ/ebmzAXL4Hcc.qAhO47t4pl4KtYu3T.9NdEW8XLErBwe = hello,hello,hello
      ('rocky@cqureacademy.com', '$2a$12$nj7Z0xOWJ/ebmzAXL4Hcc.qAhO47t4pl4KtYu3T.9NdEW8XLErBwe', false, 'rocky','Rocky Raccoonola','Expert','001 334 444 555','Running','43534533453345','500.00')
  ;

  CREATE OR REPLACE TABLE items (
    item_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description varchar(50),
    price varchar(60) NOT NULL -- VULN: wrong datatype used
  );

  INSERT INTO items (name, description, price) VALUES
    ('Dummy item 1', 'This item is mostly used to multiply 1 numbers', '1.00'),
    ('Dummy item 2', 'This item is mostly used to multiply 2 numbers', '2.00'),
    ('Dummy item 3', 'This item is mostly used to multiply 3 numbers', '3.00'),
    ('Dummy item 4', 'This item is mostly used to multiply 4 numbers', '4.00'),
    ('Dummy item 5', 'This item is mostly used to multiply 5 numbers', '5.00')
  ;

  CREATE OR REPLACE TABLE orders (
    order_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    nou int NOT NULL,
    total_cost float,
    holding_cost float,
    combined_cost float
  );

  INSERT INTO orders (name, nou, total_cost, holding_cost, combined_cost) VALUES
    ('Dummy item 1', '5', '100', '200', '300'),
    ('Dummy item 2', '4', '100', '200', '300'),
    ('Dummy item 3', '3', '100', '200', '300'),
    ('Dummy item 4', '2', '100', '200', '300'),
    ('Dummy item 5', '1', '100', '200', '300')
  ;

  CREATE OR REPLACE TABLE payments (
    payment_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description varchar(50),
    ammount float
  );

  INSERT INTO payments (name, description, ammount) VALUES
    ('Dummy order 1', 'Fully paid', '100'),
    ('Dummy order 2', 'Fully paid', '400'),
    ('Dummy order 3', 'Fully paid', '200'),
    ('Dummy order 4', 'Waiting for funds', '100'),
    ('Dummy order 5', 'Waiting for funds', '1000')
  ;

  CREATE OR REPLACE TABLE events (
    event_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    description varchar(250),
    by_who int,
    CONSTRAINT FK_by_who FOREIGN KEY (by_who) REFERENCES users(user_id)
  );

  INSERT INTO events (description, by_who) VALUES
    ('New items have been added', 2)
  ;

    CREATE OR REPLACE TABLE tools (
    tool_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    price float NOT NULL
  );

  INSERT INTO tools (name, price) VALUES
    ('Crowbar', '3.40'),
    ('Hammer', '2.00'),
    ('Skeleton key', '50.00'),
    ('Welder', '400.00')
  ;

  CREATE OR REPLACE TABLE users_tools (
    user_id int NOT NULL,
    tool_id int NOT NULL,
    PRIMARY KEY (user_id, tool_id),
    owned_number int NOT NULL
  );

  INSERT INTO users_tools (user_id, tool_id, owned_number) VALUES
    (1,1,3),
    (1,2,5),
    (2,2,10),
    (3,1,2),
    (4,2,5),
    (3,3,6),
    (1,3,2)
  ;
