require 'rails_helper'

feature 'user signs in', %q(
  As an unauthenticated user
  I want to sign in
  So that I can post items and review them
) do

#Acceptance Criteria
#If I input a registered email and password -> I sign in
#If I input an unregistered email and password or
#wrong email and/or password -> I can't sign in
#If I am already signed in -> I can't again sign in

scenario 'an existing user specifies a valid email and password' do
   user = FactoryBot.create(:user)
   visit new_user_session_path
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   # fill_in "Password confirmation", with: user.password_confirmation
   click_button "Sign in"
   expect(page).to have_content "Welcome! You have signed in successfully."
   # expect(page).to have_content "Signed out successfully."
end

 scenario 'a non-existent email and password is supplied' do
   user = FactoryBot.create(:user)
   visit new_user_session_path
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Sign in"
   expect(page).to have_content ""
   # expect(page).to_not have_content "Welcome! You have signed in successfully."
   # expect(page).to_not have_content "Sign out"
 end

 scenario 'an existing email with the wrong password is denied access' do
  user = FactoryBot.create(:user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: 'incorrectPassword'
  click_button "Sign in"
  expect(page).to have_content ""
 # expect(page).to_not have_content "Sign out"
 end

 scenario 'an already authenticated user cannot re-sign in' do
   user = FactoryBot.create(:user)
   visit new_user_session_path
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Sign in"
   expect(page).to have_content "Sign Out"
   expect(page).to_not have_content "Sign In"
 end
end
