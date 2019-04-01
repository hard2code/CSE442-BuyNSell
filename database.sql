create table user_profile(
user_id serial primary key,
ubid varchar(12) unique not null,
email varchar(50) unique not null,
username varchar(50) unique not null,
password varchar(60) not null
first_name varchar(50) not null,
last_name varchar(50) not null,
address varchar(50) not null,
city varchar(20) not null,
zip varchar(10) not null,
state varchar(10) not null
);

create table items(
item_id serial primary key,
time_post timestamp default current_timestamp,
description text,
availability boolean not null default 't',
price int,
post_by int references user_profile(user_id)
);

create table transaction(
item int references items(item_id),
from_user int references user_profile(user_id),
to_user int references user_profile(user_id),
transaction_date timestamp default current_timestamp
);

--some random input data--
insert into user_profile(ubid, email, username, password)
values ('50166666', 'mrliu@buffalo.edu', 'mr666', '666666');
insert into user_profile(ubid, email, username, password)
values ('50187324', 'something@buffalo.edu', 'something', 'randompassword');
insert into user_profile(ubid, email, username, password)
values ('50217474', 'someoneelse@buffalo.edu', 'BuyEverything', 'anotherrandompassword');

--ignore this part for now, work on it until we start working on item database
--insert into items(item_id, description, post_by)
--values (1, 'testing 123', '50166666');
--insert into items(item_id, description, post_by)
--values (2, 'test 123', '50187324');
--insert into items(description, post_by)
--values ('some 666666 item', '50166666');
--insert into items(description, post_by)
--values ('i want to sell this shit', '50187324');

--insert into transaction(item, from_user, to_user)
--values (2, '50166666', '50217474');
--insert into transaction(item, from_user, to_user)
--values (3, '50187324', '50217474');

CREATE TABLE categories(
category_id int unique not null primary key,
parent_id int,
category_name varchar(20) not null
);

insert into categories(category_id, parent_id, category_name)
values (1, null, 'Fashion');

insert into categories(category_id, parent_id, category_name)
values (2, null, 'Electronics');

insert into categories(category_id, parent_id, category_name)
values (3, null, 'Books');

insert into categories(category_id, parent_id, category_name)
values (4, null, 'Home');

insert into categories(category_id, parent_id, category_name)
values (5, null, 'Sports & Outdoor');

insert into categories(category_id, parent_id, category_name)
values (6, null, 'Music');

insert into categories(category_id, parent_id, category_name)
values (7, 1, 'Clothing');

insert into categories(category_id, parent_id, category_name)
values (8, 7, 'Men');

insert into categories(category_id, parent_id, category_name)
values (9, 7, 'Women');

insert into categories(category_id, parent_id, category_name)
values (10, 2, 'Computer & Accessories');

insert into categories(category_id, parent_id, category_name)
values (11, 2, 'Cell Phone & Accessories');

insert into categories(category_id, parent_id, category_name)
values (12, 2, 'Video Games');

insert into categories(category_id, parent_id, category_name)
values (13, 2, 'TV & Home Audio');

insert into categories(category_id, parent_id, category_name)
values (14, 3, 'Textbook');

insert into categories(category_id, parent_id, category_name)
values (15, 3, 'Comics');

insert into categories(category_id, parent_id, category_name)
values (15, 3, 'Novel');

insert into categories(category_id, parent_id, category_name)
values (16, 15, 'Top Sellers');

insert into categories(category_id, parent_id, category_name)
values (17, 15, 'Romance');

insert into categories(category_id, parent_id, category_name)
values (18, 15, 'Business & Investing');

insert into categories(category_id, parent_id, category_name)
values (19, 4, 'Furniture');

insert into categories(category_id, parent_id, category_name)
values (20, 4, 'Kitchen');

insert into categories(category_id, parent_id, category_name)
values (21, 4, 'Lawn & Garden');

insert into categories(category_id, parent_id, category_name)
values (22, 4, 'Home Improvement');

insert into categories(category_id, parent_id, category_name)
values (23, 5, 'Sports & Fitness');

insert into categories(category_id, parent_id, category_name)
values (24, 5, 'Cycling');

insert into categories(category_id, parent_id, category_name)
values (25, 5, 'Skateboards');

insert into categories(category_id, parent_id, category_name)
values (26, 5, 'Camping & Hiking');

insert into categories(category_id, parent_id, category_name)
values (27, 5, 'Sports & Fitness');

insert into categories(category_id, parent_id, category_name)
values (28, 6, 'Musical Instruments');

insert into categories(category_id, parent_id, category_name)
values (29, 6, 'Band Posters');

insert into categories(category_id, parent_id, category_name)
values (30, 6, 'CDs');

insert into categories(category_id, parent_id, category_name)
values (31, 28, 'Guitars & Amps');

insert into categories(category_id, parent_id, category_name)
values (31, 28, 'Piano & Keyboards');

insert into categories(category_id, parent_id, category_name)
values (31, 28, 'Recording');