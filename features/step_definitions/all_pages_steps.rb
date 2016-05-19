When(/^I visit the homepage$/) do
  visit "/"
end

Then(/^I should see "(.*?)" and "(.*?)"/) do |content1, content2|
  expect(page).to have_content(content1)
  expect(page).to have_content(content2)
end

When(/^I click in "(.*?)"/) do |link|
  find('a', text: link, :match => :prefer_exact).click
end

When(/^I look into class "(.*?)" and I click in "(.*?)"/) do |class_name,link|
	within(class_name) do
		find('a', text: link, :match => :prefer_exact).click
	end
end

When(/^I visit the sign in page$/) do
  visit new_user_session_path
end

When(/^I visit the sign up page$/) do
  visit new_user_registration_path
end

When(/^I log in as "(.*?)" and password "(.*?)"$/) do |email,password|
  User.new(:name => "John Smith", :email => email, :password => password, :password_confirmation => password).save!
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

When(/^I sign up as "(.*?)" with email "(.*?)" and password "(.*?)"$/) do |name,email,password|
  visit '/users/sign_up'
  fill_in "user_name", :with => name
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => password
  click_button "Sign up"
end

