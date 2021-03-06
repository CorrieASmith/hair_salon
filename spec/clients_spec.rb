require('spec_helper')

describe(Clients) do

  describe('#==') do
    it("is considered identical if two clients have the same information") do
      client1 = Clients.new({:name => "Ingrid", :email => "thegridmonster@gmail.com", :phone => 555-5555, :city => "Los Angeles", :zip => 980001, :id => nil})
      client2 = Clients.new({:name => "Ingrid", :email => "thegridmonster@gmail.com", :phone => 555-5555, :city => "Los Angeles", :zip => 980001, :id => nil})
      expect(client1).to eq(client2)
    end
  end

  describe('#save') do
    it("saves a new client to the database") do
      test_client = Clients.new({:name => "Claudia", :email => "beyondbeauty@gmail.com", :phone => 666-6666, :city => "Los Angeles", :zip => 980001, :id => nil})
      test_client.save()
      expect(Clients.all()).to eq([test_client])
    end
  end

  describe('.find') do
    it("finds a new client by his/her id") do
      test_client1 = Clients.new({:name => "Tyler", :email => "tyleroakley@gmail.com", :phone => 777-7777, :city => "Los Angeles", :zip => 980001, :id => nil})
      test_client1.save()
      test_client2 = Clients.new({:name => "Jenna", :email => "jennamarbles@gmail.com", :phone => 888-8888, :city => "Los Angeles", :zip => 980001, :id => nil})
      test_client2.save()
      expect(Clients.find(test_client2.id())).to eq(test_client2)
    end
  end

  describe('#update') do
    it("allows the salon owner to update client information") do
      client = Clients.new({:name => "Shane", :email => "shanedawson@gmail.com", :phone => 999-9999, :city => "Los Angeles", :zip => 980001, :id => nil})
      client.save()
      client.update({:name => "Shane", :email => "shanesnewemail@gmail.com", :phone => 444-4444, :city => "Los Angeles", :zip => 980001, :id => nil})
      expect(client.email()).to(eq("shanesnewemail@gmail.com"))
    end

    it("lets you add a stylist to a client") do
      client = Clients.new({:name => "Shane", :email => "shanedawson@gmail.com", :phone => 999-9999, :city => "Los Angeles", :zip => 980001, :id => nil})
      client.save()
      ursula = Stylists.new({:name => "Ursula", :salon => "A Tease to Dye For", :phone => 123-4567, :id => nil})
      ursula.save()
      kevin = Stylists.new({:name => "Kevin", :salon => "Shangri-Locks", :phone => 123-4567, :id => nil})
      kevin.save()
      client.update({:stylist_id => [ursula.id(), kevin.id()]})
      expect(client.stylists()).to(eq([ursula, kevin]))
    end
  end

  describe("#stylists") do
    it("returns all of the stylists of a particular client") do
      client = Clients.new({:name => "Shane", :email => "shanedawson@gmail.com", :phone => 999-9999, :city => "Los Angeles", :zip => 980001, :id => nil})
      client.save()
      ursula = Stylists.new({:name => "Ursula", :salon => "A Tease to Dye For", :phone => 123-4567, :id => nil})
      ursula.save()
      kevin = Stylists.new({:name => "Kevin", :salon => "Shangri-Locks", :phone => 123-4567, :id => nil})
      kevin.save()
      client.update({:stylist_id => [ursula.id(), kevin.id()]})
      expect(client.stylists()).to(eq([ursula, kevin]))
    end
  end

  describe('#delete') do
    it("allows the salon owner to delete a client from the database") do
      client = Clients.new({:name => "Bethany", :email => "bethanymota@gmail.com", :phone => 111-1111, :city => "Los Angeles", :zip => 980001, :id => nil})
      client.save()
      client.delete()
      expect(Clients.all()).to(eq([]))
    end
  end
end
