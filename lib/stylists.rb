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
end
