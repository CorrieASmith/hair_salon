require('rspec')
require('clients')
require('stylists')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end
end
