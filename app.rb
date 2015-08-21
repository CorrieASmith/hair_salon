require('sinatra')
require('sinatra/reloader')
require('./lib/clients')
require('./lib/stylists')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @clients = Clients.all()
  @stylists = Stylists.all()
  erb(:index)
end

get('/clients') do
  @clients = Clients.all()
  erb(:clients)
end

get('/stylists') do
  @stylists = Stylists.all()
  erb(:stylists)
end

post('/clients/new') do
  name = params.fetch('name')
  email = params.fetch('email')
  phone = params.fetch('phone')
  city = params.fetch('city')
  zip = params.fetch('zip')
  client = Clients.new({:name => name, :email => email, :phone => phone, :city => city, :zip => zip, :id => nil})
  client.save()
  redirect('/clients')
end

post('/stylists/new') do
  name = params.fetch('name')
  salon = params.fetch('salon')
  phone = params.fetch('phone')
  stylist = Stylists.new({:name => name, :salon => salon, :phone => phone, :id => nil})
  stylist.save()
  redirect('/stylists')
end

get('/clients/:id') do
  @client = Clients.find(params.fetch("id").to_i())
  @clients = Clients.all()
  erb(:clients)
end

get('/clients_edit/:id') do
  @client = Clients.find(params.fetch("id").to_i())
  @client_name = @client.name()
  @client_id = @client.id()
  erb(:clients_edit)
end

patch('/clients/:id/name') do
  name = params.fetch('name')
  @client = Clients.find(params.fetch("id").to_i())
  email = @client.email()
  phone = @client.phone()
  city = @client.city()
  zip = @client.zip()
  @client.update({:name => name, :email => email, :phone => phone, :city => city, :zip => zip})
  @client = Clients.all()
  redirect('/clients')
end

patch('/clients/:id/email') do
  email = params.fetch('email')
  @client = Clients.find(params.fetch("id").to_i())
  name = @client.name()
  phone = @client.phone()
  city = @client.city()
  zip = @client.zip()
  @client.update({:name => name, :email => email, :phone => phone, :city => city, :zip => zip})
  @client = Clients.all()
  redirect('/clients')
end

patch('/clients/:id/phone') do
  phone = params.fetch('phone')
  @client = Clients.find(params.fetch("id").to_i())
  name = @client.name()
  email = @client.email()
  city = @client.city()
  zip = @client.zip()
  @client.update({:name => name, :email => email, :phone => phone, :city => city, :zip => zip})
  @client = Clients.all()
  redirect('/clients')
end

patch('/clients/:id/city') do
  city = params.fetch('city')
  @client = Clients.find(params.fetch("id").to_i())
  name = @client.name()
  email = @client.email()
  phone = @client.phone()
  zip = @client.zip()
  @client.update({:name => name, :email => email, :phone => phone, :city => city, :zip => zip})
  @client = Clients.all()
  redirect('/clients')
end

patch('/clients/:id/zip') do
  zip = params.fetch('zip')
  @client = Clients.find(params.fetch("id").to_i())
  name = @client.name()
  email = @client.email()
  phone = @client.phone()
  city = @client.city()
  @client.update({:name => name, :email => email, :phone => phone, :city => city, :zip => zip})
  @client = Clients.all()
  redirect('/clients')
end

delete("/clients/:id") do
  @client = Clients.find(params.fetch("id").to_i())
  @client.delete()
  @clients = Clients.all()
  redirect('/clients')
end

get('/stylists/:id') do
  @stylist = Stylists.find(params.fetch("id").to_i())
  @stylists = Stylists.all()
  erb(:stylists)
end

get('/stylists_edit/:id') do
  @stylist = Stylists.find(params.fetch("id").to_i())
  @stylist_name = @stylist.name()
  @stylist_id = @stylist.id()
  erb(:stylists_edit)
end

patch('/stylists/:id/name') do
  name = params.fetch('name')
  @stylist = Stylists.find(params.fetch("id").to_i())
  salon = @stylist.salon()
  phone = @stylist.phone()
  @stylist.update({:name => name, :salon => salon, :phone => phone})
  @stylists = Stylists.all()
  redirect('/stylists')
end

patch('/stylists/:id/salon') do
  salon = params.fetch('salon')
  @stylist = Stylists.find(params.fetch("id").to_i())
  name = @stylist.name()
  phone = @stylist.phone()
  @stylist.update({:name => name, :salon => salon, :phone => phone})
  @stylists = Stylists.all()
  redirect('/stylists')
end

patch('/stylists/:id/phone') do
  phone = params.fetch('phone')
  @stylist = Stylists.find(params.fetch("id").to_i())
  name = @stylist.name()
  salon = @stylist.salon()
  @stylist.update({:name => name, :salon => salon, :phone => phone})
  @stylists = Stylists.all()
  redirect('/stylists')
end

delete("/stylists/:id") do
  @stylist = Stylists.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylists.all()
  redirect('/stylists')
end

patch("/clients/:id") do
  client_id = params.fetch("id").to_i()
  @client = Clients.find(client_id)
  stylist_id = params.fetch("stylist_id")
  @client.update({:stylist_id => stylist_id})
  @stylists = Stylists.all()
  erb(:client_info)
end

patch("/stylists/:id") do
  stylist_id = params.fetch("id").to_i()
  @stylist = Stylists.find(stylist_id)
  client_id = params.fetch("client_id")
  @stylist.update({:client_id => client_id})
  @clients = Clients.all()
  erb(:stylist_info)
end
