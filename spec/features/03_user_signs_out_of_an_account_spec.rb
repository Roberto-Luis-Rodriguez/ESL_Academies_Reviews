require 'rails_helper'

feature 'user signs out', %q(
  As an unauthenticated user
  I want to sign in
  So that I can post items and review them
) do

# Acceptance Criteria
# As an authenticated user already signed in
# I want to be able to see the sign out link to click on
# Which will lead to me signing out of my profile on the site
# And lead me back to either signing in or signing up on the index page

scenario 'an existing user signs out of account' do
   user = FactoryBot.create(:user)
   visit new_user_session_path
   # login_as(user, :scope => :user)
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password

   click_button "Sign in"
   visit root_path

   # expect(page).to_not have_content('Sign Out')
   # expect(page).to have_content('Sign Up')
   # expect(page).to have_content('Forget your password?')
 end
end
