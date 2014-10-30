Feature: send a text message

  As an admisitrator
  I want to send a text to a phone number
  So that I can notify a parent of an event

Background: nothing

Scenario: send a text and receive notice of failure
	Given I am on the text page
	When I fill in "aNum" with "334"
	And I press "Send!"
	Then I should see "The number(s) ["
	And I should see "334"
	And I should see "] are invalid, others sent successfully"

Scenario: send a text and receive notice of success
	Given I am on the text page
	When I fill in "aNum" with "2532363623"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "Message sent successfully."
