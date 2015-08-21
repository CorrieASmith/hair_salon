require('spec_helper')

describe(Clients) do

  describe('.all') do
    it('is empty at first') do
      expect(Clients.all()).to(eq([]))
    end
  end
end
