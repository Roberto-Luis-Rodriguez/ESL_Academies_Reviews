require 'rails_helper'

feature 'sign up', %q(
  As a prospective user
  I want to create an account
  So that I can post items and review them
) do

#Acceptance Criteria
#I must specify a valid email address
#I must specify a password and confirm that password
#If I don't peform the above, I get an error message
#If I specify valid informnation, I register my account and am authenticated

scenario "User successfully creates an account" do

   visit new_user_registration_path
   fill_in "Email", with: "me@me.com"
   fill_in "Password", with: "1234567"
   fill_in "Password confirmation", with: "1234567"
   click_button "Sign up"

   expect(page).to have_content "Welcome! You have signed up successfully."

 end

 scenario 'user fails to create an account' do
   # visit root_path
   visit new_user_registration_path
   click_button 'Sign up'
   #
   # expect(page).to have_content('2 errors prohibited this user from being saved:')
   expect(page).to have_content("can't be blank")
   expect(page).to_not have_content("Sign out")
 end

 scenario 'password confirmation does not match confirmation' do
   # visit root_path
   visit new_user_registration_path
   click_button 'Sign up'

   fill_in 'Password', with: '1234567'
   fill_in 'Password confirmation', with: 'somethingDifferent'

   expect(page).to have_content("")
   expect(page).to_not have_content("Sign out")
 end
end
