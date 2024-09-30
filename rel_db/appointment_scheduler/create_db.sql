create database salon;

\c salon;

CREATE table customers (
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(20) unique,
  name varchar(80)
);

create table services (
  service_id SERIAL PRIMARY KEY,
  name varchar(80)
);

create table appointments (
  appointment_id SERIAL PRIMARY KEY,
  time varchar(20),
  customer_id integer references customers(customer_id),
  service_id integer references services(service_id)
);

INSERT INTO services
  (name)
VALUES
('Wash'),
('Massage'),
('Trim')