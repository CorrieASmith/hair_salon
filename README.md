# hair_salon 

This is my third code review. Hair Salon is a website that holds information for clients and stylists.
The user is able to add new clients and stylists to the database and edit their information accordingly.
The user is also able to add clients to stylists and vice versa. 
All of the back end code is passing, and the application runs on the Sinatra server. 

The PSQL database details for this application are as follows:

CREATE DATABASE hair_salon;
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, email varchar, phone int, city varchar, zip int);
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, salon varchar, phone int);
CREATE TABLE clients_stylists (id serial PRIMARY KEY, client_id int, stylist_id int);






