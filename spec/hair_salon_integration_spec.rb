require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a client to the hair_salon database', {:type => :feature}) do
  it('adds a client to the hair_salon database') do
    visit ('/clients')
    fill_in('name', :with => "Jenna")
    fill_in('email', :with => "jennamarbles@gmail.com")
    fill_in('phone', :with => 5555555)
    fill_in('city', :with => "Los Angeles")
    fill_in('zip', :with => 98000)
    click_button('Add Client')
    expect(page).to have_content('Jenna')
  end
end
