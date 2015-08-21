require('sinatra')
require('sinatra/reloader')
require('./lib/clients')
require('./lib/stylists')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
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
