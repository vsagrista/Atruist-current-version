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

describe "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it "signs me in" do
    visit '/users/sign_in'
    within("#session") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      expect(response).to have_http_status(302)
      expect(page).to have_content 'Dashboard'
    end
   # click_on "Log In"
   
    #expect(page).to have_content 'Dashboard'
  end
end

#requests