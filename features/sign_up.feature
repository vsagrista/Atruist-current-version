Feature: Sign in page

Scenario: Home page links not signed in
	When I visit the sign up page
	And I sign up as "John Smith" with email "test@test.com" and password "12345678"
	Then I should see "Welcome, John Smith" and "Add Address!"