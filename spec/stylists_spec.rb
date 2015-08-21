require('spec_helper')

describe(Stylists) do

  describe('.all') do
    it("is empty at first") do
      expect(Stylists.all()).to(eq([]))
    end
  end
end
