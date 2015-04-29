Feature: send a text to all numbers
	
  As an admisitrator
  I want to send a text to all the phone numbers
  So that I can notify all parents of an event

 Background: some users have been added to database

  Given the following classrooms exist:
  | name |
  | Room A    |

  Given the following students exist:
   | Student_Name | Parent_Name  | Phone_Number | Email                  | classroom_name |
   | Clint Barton | Bruce Banner | 2532363623   | teamfirealarm@gmail.com| Room A |
   | Loki    	    | Thor   	     | 2532363623   | teamfirealarm@gmail.com| Room A |
   | Hank Pym     | Tony Stark   | 2532363623   | teamfirealarm@gmail.com| Room A |
   | Peter Parker | Steve Rogers | 2532363623   | teamfirealarm@gmail.com| Room A |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  |
  Given I am logged in as admin
  And I am on the students page

Scenario: send a text to all numbers and receive notice of success
	Given I am on the text page
	When I fill in "aMessage" with "Avergers assemble!"
	And I press "Send To All!"
	Then I should see "Message sent successfully."

Scenario: send a text to all numbers and receive notice of failure
Given the following students exist:$
   | Student_Name | Parent_Name | Phone_Number | Email|
   | QuickSilver  | Magneto     | xxxxxxxxxx   | teamfirealarm@gmail.com|
	Given I am on the text page
	When I fill in "aMessage" with "A call to all X-men!"
	And I press "Send To All!"
	Then I should see "The contact(s) [xxxxxxxxxx] are invalid, others sent successfully"

Scenario: send a text all number with multiple incorrect numbers
Given the following students exist:$
   | Student_Name | Parent_Name | Phone_Number | Email|
   | Sam Willson  | Red Wing    | xxxxxxxxxx  | teamfirealarm@gmail.com|
   | DeadPool     | Nick Fury   | xxxxxxxxxx | teamfirealarm@gmail.com|
	Given I am on the text page
	When I fill in "aMessage" with "Caw Caw"
	And I press "Send To All!"
	Then I should see "The contact(s) [xxxxxxxxxx, xxxxxxxxxx] are invalid, others sent successfully"








