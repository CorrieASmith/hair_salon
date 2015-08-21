class Stylists
  attr_reader(:name, :salon, :phone, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @salon = attributes.fetch(:salon)
    @phone = attributes.fetch(:phone).to_i()
    @id = attributes.fetch(:id).to_i()
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      salon = stylist.fetch("salon")
      phone = stylist.fetch("phone")
      id = stylist.fetch("id")
      stylists.push(Stylists.new({:name => name, :salon => salon, :phone => phone, :id => id}))
    end
    stylists
  end

  define_method(:==) do |other|
    self.id().eql?(other.id())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name, salon, phone) VALUES ('#{@name}', '#{@salon}', #{@phone}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    Stylists.all().each() do |stylist|
      if stylist.id() == id
        return stylist
      end
    end
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @salon = attributes.fetch(:salon, @salon)
    @phone = attributes.fetch(:phone, @phone)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id}")
    DB.exec("UPDATE stylists SET salon = '#{@salon}' WHERE id = #{@id}")
    DB.exec("UPDATE stylists SET phone = #{@phone} WHERE id = #{@id}")

    attributes.fetch(:client_id, []).each() do |client_id|
      DB.exec("INSERT INTO clients_stylists (stylist_id, client_id) VALUES (#{self.id()}, #{client_id});")
    end
  end

  define_method(:clients) do
    clients_stylists = []
    results = DB.exec("SELECT client_id FROM clients_stylists WHERE stylist_id = #{self.id()};")
    results.each() do |result|
      client_id = result.fetch("client_id").to_i()
      client = DB.exec("SELECT * FROM clients WHERE id = #{client_id};")
      name = client.first().fetch("name")
      email = client.first().fetch("email")
      phone = client.first().fetch("phone")
      city = client.first().fetch("city")
      zip = client.first().fetch("zip")
      clients_stylists.push(Clients.new({:name => name, :email => email, :phone => phone, :city => city, :zip => zip, :id => client_id}))
    end
    clients_stylists
  end

  define_method(:delete) do
      DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end
end
