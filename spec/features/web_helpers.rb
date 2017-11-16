def add_link
  fill_in 'url', with: 'https://www.google.com'
  fill_in 'title', with: 'Google'
  fill_in 'tag', with: 'browser'
  click_button 'Submit'
end
