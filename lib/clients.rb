class Clients
  attr_reader(:name, :email, :phone, :city, :zip, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @email = attributes.fetch(:email)
    @phone = attributes.fetch(:phone).to_i()
    @city = attributes.fetch(:city)
    @zip = attributes.fetch(:zip).to_i()
    @id = attributes.fetch(:id).to_i()
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      email = client.fetch("email")
      phone = client.fetch("phone")
      city = client.fetch("city")
      zip = client.fetch("zip")
      id = client.fetch("id")
      clients.push(Clients.new({:name => name, :email => email, :phone => phone, :city => city, :zip => zip, :id => id}))
    end
    clients
  end
end
