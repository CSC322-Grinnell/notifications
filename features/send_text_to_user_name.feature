Feature: send a text message by a user's name

  As an admisitrator
  I want to send a text by a student/parent's name
  So that I don't have to type in the numbers

 Background: there is a student in the database

  Given the following classrooms exist:
  | name |
  | Room A    |

  Given the following students exist:
  | student_name | Parent_Name | Phone_Number | Email                      | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | 1    |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  |
  Given I am logged in as admin
  And I am on the students page

  Scenario: send a text by using a student's name
	Given I am on the text page
	When I fill in "aNum" with "Khoa Nguyen"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "Message sent successfully."

  Scenario: send a text by using a parent's name
	Given I am on the text page
	When I fill in "aNum" with "Jason Liu"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "Message sent successfully."

  Scenario: send a text using multiple names
	Given I am on the text page
	When I fill in "aNum" with "Jason Liu, Khoa Nguyen"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "Messages sent successfully."

  Scenario: send a text using names and numbers
	Given I am on the text page
	When I fill in "aNum" with "2532363623, Khoa Nguyen"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "Messages sent successfully."

  Scenario: send a text using names not int the database
	Given I am on the text page
	When I fill in "aNum" with "Hank McCoy, Rachel"
	When I fill in "aMessage" with "This is a test"
	And I press "Send!"
	Then I should see "The contact(s) [Hank McCoy, Rachel] are invalid, others sent successfully"
