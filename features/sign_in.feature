Feature: Sign in page

Scenario: Home page links not signed in
	When I visit the sign in page
	And I log in as "test@test.com" and password "12345678"
	Then I should see "Welcome" and "minutes"