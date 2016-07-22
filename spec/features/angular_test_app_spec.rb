require 'rails_helper'

feature 'angular_test' do
  let(:email) { 'bob@example.com' }
  let(:password) { 'password123' }
  
  before do
    User.create!(email: email,
                 password: password,
                 password_confirmation: password)
  end
  
  #tests
  
  scenario 'Our Angular Test App is working' do
    visit "/angular_test"
    
    #Log in
    fill_in 'Email',  with: 'bob@example.com'
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    
    #check we can go to the right page
    expect(page).to have_content('Name')
    
    #test the page
    fill_in 'name', with: 'Bob'
    within 'header h1' do
      expect(page).to have_content('Hello, Bob')
    end
  end
  
  
end