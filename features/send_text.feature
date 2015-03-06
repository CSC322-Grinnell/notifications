Feature: send a text message

  As an admisitrator
  I want to send a text to a phone number
  So that I can notify a parent of an event

Background: some users have been added to database

  Given the following classrooms exist:
  | name |
  | Room A    |
  
  Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                      | classroom_name |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | Room A    |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  |
  Given I am logged in as admin

Scenario: send a text and receive notice of failure
	Given I am on the text page
	When I fill in "aNum" with "334"
	When I fill in "aMessage" with "Its time to digivolve!"
	And I press "Send!"
	Then I should see "The contact(s) [334] are invalid, others sent successfully"

Scenario: send a text and receive notice of success
	Given I am on the text page
	When I fill in "aNum" with "2532363623"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "Message sent successfully."

Scenario: send a text to multiple incorrect numbers
	Given I am on the text page
	When I fill in "aNum" with "334, 5673465"
	When I fill in "aMessage" with "The truth is out there."
	And I press "Send!"
	Then I should see "The contact(s) [334, 5673465] are invalid, others sent successfully"

Scenario: send a text to multiple valid numbers
	Given I am on the text page
	When I fill in "aNum" with "2532363623, 2532363623"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "Messages sent successfully."

Scenario: send a text to multiple valid numbers without a message
	Given I am on the text page
	When I fill in "aNum" with "2532363623, 2532363623"
	And I press "Send!"
	Then I should see "Message Required"

Scenario: send a text to one invalid numbers with a message
	Given I am on the text page
	When I fill in "aNum" with "XXXXXXXXXXX"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "The contact(s) [XXXXXXXXXXX] are invalid, others sent successfully"

Scenario: send a text to one valid numbers without a message
	Given I am on the text page
	When I fill in "aNum" with "Khoa Nguyen"
	And I press "Send!"
	Then I should see "Message Required"

