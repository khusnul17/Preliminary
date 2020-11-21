create table ku_user_status
   (id int(10) primary key,
   name varchar (50),
   created_at date,
   updated_at date
   );
   
create table ku_user_location_type
   (id int (10) primary key,
   name varchar (50),
   created_at date,
   updated_at date
   );
   
create table ku_user_location_status
   (id int (10) primary key,
   name varchar (50),
   created_at date,
   updated_at date
   );

create table ku_user
   (id int (10) primary key,
   name varchar (50),
   email varchar (50),
   phone varchar (50),
   password_hash varchar (50),
   salt varchar (50),
   photo varchar (50),
   status int (10) references ku_user_status(id),
   created_at date,
   updated_at date
   );

create table ku_order_status
   (id int (10) primary key,
   name varchar (50),
   created_at date,
   updated_at date
   );

create table ku_product_status
   (id int (10) primary key,
   name varchar (50),
   created_at date,
   updated_at date
   );    
   
create table ku_user_location
   (id int (10) primary key,
   type int (10) references ku_user_location_type(id),
   status int (10) references ku_user_location_status(id),
   user_id int (10) references ku_user(id),
   location varchar (200),
   address varchar (200),
   created_at date,
   updated_at date
   );
   
create table ku_order
   (id int (10) primary key,
   user_id int (10) references ku_user(id),
   status int (10) references ku_order_status(id),
   created_at date,
   updated_at date
   ); 

create table ku_product
   (id int (10) primary key,
   name varchar (50),
   effective_date date,
   effective_until date,
   photo varchar (50),
   price float (50),
   status int (10) references ku_product_status(id),
   created_at date,
   updated_at date
   ); 
   
create table ku_category
   (id int (10) primary key,
   name varchar (50),
   created_at date,
   updated_at date
   );   
   
create table ku_order_detail_status
   (id int (10) primary key,
   name varchar (50),
   created_at date,
   updated_at date
   );
   
create table ku_product_category
   (id int (10) primary key,
   product_id int (10) references ku_product(id),
   category_id int (10) references ku_category(id),
   created_at date,
   updated_at date
   ); 
   
create table ku_order_detail
   (id int (10) primary key,
   user_location_id int (10) references ku_user_location(id),
   order_id int (10) references ku_order(id),
   product_id int (10) references ku_product(id),
   quantity int (50),
   delivery_date date,
   status int (10) references ku_order_detail_status(id),
   created_at date,
   updated_at date
   );
   
