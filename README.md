# _Hair Salon - Code Review_

##### An app that stores information for hair salon employees and their clients, 08/21/2015 

#### By _**Corrie Smith**_

## Description

_This is my second code review. Hair Salon is a simple web application that stores information for hair salon employees and their clients. The user is able to add new stylists and new clients to the database, as well as add a stylist to a client and vice versa. See the instructions below to set up this database on your personal computer._

## Setup

* _CREATE DATABASE hair_salon;_
* _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, email varchar, phone int, city varchar, zip int);_
* _CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, salon varchar, phone int);_
* _CREATE TABLE clients_stylists (id serial PRIMARY KEY, client_id int, stylist_id int);_

_This app runs on the Sinatra server, so make sure to run the command "ruby app.rb" before you open it._

## Technologies Used

_The language I used to create this app was predominantly Ruby. I also used some basic HTML in my "views" folder._

### Legal

Copyright (c) 2015 **_Corrie Smith_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
