require('spec_helper')

describe(Stylists) do

  describe('.all') do
    it("is empty at first") do
      expect(Stylists.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is considered identical if two stylists have the same information") do
      stylist1 = Stylists.new({:name => "Lauren", :salon => "The End Salon", :phone => 123-4567, :id => nil})
      stylist2 = Stylists.new({:name => "Lauren", :salon => "The End Salon", :phone => 123-4567, :id => nil})
      expect(stylist1).to eq(stylist2)
    end
  end

end
