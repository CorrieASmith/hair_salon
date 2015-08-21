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

  describe('#save') do
    it("saves a new stylist to the database") do
      test_stylist = Stylists.new({:name => "Ursula", :salon => "Ooh Girl Who Did Your Hair Salon", :phone => 234-5678, :id => nil})
      test_stylist.save()
      expect(Stylists.all()).to eq([test_stylist])
    end
  end

  describe('.find') do
    it("finds a new stylist by his/her id") do
      test_stylist1 = Stylists.new({:name => "Peter", :salon => "Curl Up & Dye", :phone => 456-7890, :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylists.new({:name => "Marie", :salon => "Hair Today Gone Tomorrow", :phone => 987-6543, :id => nil})
      test_stylist2.save()
      expect(Stylists.find(test_stylist2.id())).to eq(test_stylist2)
    end
  end

  describe('#update') do
    it("allows the salon owner to update stylist information") do
      stylist = Stylists.new({:name => "Kenny", :salon => "Cut the Crap Salon", :phone => 333-9999, :id => nil})
      stylist.save()
      stylist.update({:name => "Kenny", :salon => "Absolutely UnbeWEAVEable", :phone => 333-9999, :id => nil})
      expect(stylist.salon()).to(eq("Absolutely UnbeWEAVEable"))
    end
  end
end
