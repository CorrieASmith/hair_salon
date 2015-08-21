require('spec_helper')

describe(Clients) do

  describe('.all') do
    it('is empty at first') do
      expect(Clients.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is considered identical if two clients have the same information') do
      client1 = Clients.new({:name => "Ingrid", :email => "thegridmonster@gmail.com", :phone => 555-5555, :city => "Los Angeles", :zip => 980001, :id => nil})
      client2 = Clients.new({:name => "Ingrid", :email => "thegridmonster@gmail.com", :phone => 555-5555, :city => "Los Angeles", :zip => 980001, :id => nil})
      expect(client1).to eq(client2)
    end
  end
end
