Feature: Home page

Scenario: Home page links not signed in
	When I visit the homepage
	Then I should see "Altruist" and "Log In"
	Then I click in "Log In"
	And I should see "Email" and "Password"
	When I click in "Home"
	Then I should see "Altruist" and "Log In"
	When I visit the homepage
	And I click in "Join"
	Then I should see "Name" and "Password confirmation"
	When I visit the homepage
	And I look into class ".jumbotron" and I click in "Join"
	Then I should see "Name" and "Password confirmation"