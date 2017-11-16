require 'capybara/rspec'
require './app/models/link.rb'
require './app/models/tag.rb'

feature "List of links on homepage" do
  scenario 'When i\'m visiting a home page I get a list of my links ' do
      link = Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.create(name: '#coding')])
      visit('/links')
      expect(page.status_code).to eq 200
      within 'ul#links' do
      expect(page).to have_content "Makers Academy"
    end
  end
end

feature "An option to add and display a tag to link" do
  scenario 'When i am adding a new link I can give it a tag' do
    link = Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.create(name: '#coding')])
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content "Tags: #coding"
    end
  end
end

feature "I'd like to see my links filtered by tags" do
  scenario 'When I add a tag to a link, that link should be in the list of links with that tag' do
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'browser')])
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'bubbles')])
    visit('/tags/bubbles')
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Facebook'
    expect(page).not_to have_content 'Google'
  end
end
