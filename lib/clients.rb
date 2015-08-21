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

  define_method(:==) do |other|
    self.id().eql?(other.id())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, email, phone, city, zip) VALUES ('#{@name}', '#{@email}', #{@phone}, '#{@city}', #{@zip}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    Clients.all().each() do |client|
      if client.id() == id
        return client
      end
    end
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @email = attributes.fetch(:email)
    @phone = attributes.fetch(:phone)
    @city = attributes.fetch(:city)
    @zip = attributes.fetch(:zip)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id}")
    DB.exec("UPDATE clients SET email = '#{@email}' WHERE id = #{@id}")
    DB.exec("UPDATE clients SET phone = #{@phone} WHERE id = #{@id}")
    DB.exec("UPDATE clients SET city = '#{@city}' WHERE id = #{@id}")
    DB.exec("UPDATE clients SET zip = #{@zip} WHERE id = #{@id}")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end
end
