When(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see "(.*?)" and "(.*?)"/) do |content1, content2|
  expect(page).to have_content(content1)
  expect(page).to have_content(content2)
#expect(page).to have_content('Log in')
end