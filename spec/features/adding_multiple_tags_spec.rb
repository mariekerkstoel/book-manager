require 'capybara/rspec'
require './app/models/link.rb'
require './app/models/tag.rb'

feature "Allowing users to add multiple tags " do
  scenario "The user is invited to add more than one tag" do
    visit '/links/new'
    add_link
    expect(page).to have_button('Add tag')
    expect(page).to have_field('tag')
    expect(page).to have_button('Finish')
  end
end
