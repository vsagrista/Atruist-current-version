Feature: Dashboard

Scenario: Dashboard page
	When I visit the sign in page
	And I log in as "test@test.com" and password "12345678"
	Then I should see "Welcome" and "minutes"
	And I click in "Add Address!"
	Then I should see "Address Search" and "Add Address"
