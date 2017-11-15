require 'capybara/rspec'
require './app/models/link.rb'

feature "List of links on homepage" do
  scenario 'When i\'m visiting a home page I get a list of my links ' do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit('/links')
      expect(page.status_code).to eq 200
      within 'ul#links' do
      expect(page).to have_content "Makers Academy"
    end
  end
end
