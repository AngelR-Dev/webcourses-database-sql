CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "phone" int,
  "country" char(3),
  "gender" varchar,
  "role_id" serial
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "price" money
);

CREATE TABLE "lessons" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "duration" int,
  "lesson_number" serial,
  "url_video" varchar,
  "courses_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "courses_categories" (
  "id" uuid PRIMARY KEY,
  "courses_id" uuid,
  "categories_id" serial
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "libraries" (
  "id" uuid PRIMARY KEY,
  "courses_id" uuid,
  "users_id" uuid
);

ALTER TABLE "libraries" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "libraries" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "lessons" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");


-- insert roles

insert into roles (
  id,
  name
) values (
  1,
  'admin'
), (
  2,
  'teacher'
), (
  3,
  'student'
);


--  insert users

insert into users (
	id, 
	first_name, 
	last_name, 
	email, 
	"password",
	age,
	phone,
	country,
	gender,
	role_id  
) values (
	'21be0f7d-e6d4-4690-af85-8776615f951c', 
	'Raul', 
	'Martines', 
	'Raul@academlo.com', 
	'root',
	26,
	987654321,
	'ARG',
	'Male',
	2
), (
	'3a335673-f3e1-4bc1-829b-c51ed3c3507f', 
	'Angel', 
	'Roldan', 
	'Angel@academlo.com', 
	'root',
	31,
	123456789,
	'MXN',
	'Male',
	1
);