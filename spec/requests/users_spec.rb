require 'rails_helper'


RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end

describe "Create place scenario" do
  context "Go to home page" do
    it "opens homepage" do
      visit(new_user_registration_path)
      expect(response).to have_http_status(200)
    end
  end
end

feature "Signing in" do
  background do
    User.create(:email => 'user@example.com', :password => 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit '/users/sign_in'
    within("#session") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin'
      click_button 'Sign in'
    expect(page).to have_content 'Dashboard'
    end
    
  end

  given(:other_user) { User.create(:email => 'other@example.com', :password => 'rous') }

  scenario "Signing in as another user" do
    visit '/users/sign_in'
    within("#session") do
      fill_in 'Email', :with => other_user.email
      fill_in 'Password', :with => other_user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end
end

