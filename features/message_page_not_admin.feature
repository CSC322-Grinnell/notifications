Feature: send text messages
	As a teacher
	I want to send texts to classrooms and individuals
	So that I can notify students of school events

Background:users and students and classrooms have been added to the database

	Given the following classrooms exist:
	|name|
	|Room A|
	|Room B|
	|Room C|

	Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                      | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | 1    |
  | Crusty Jones  | Spice   | 2532363623   | teamfirealarm@gmail.com    | 2    |
  | Sultan of Lust  | Everything Nice   | 2532363623   | teamfirealarm@gmail.com    | 1    |
  | Czar of Lust  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | 2    |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login         |    admin   |  classroom_ids    | classroom_ids |
  | NotAdministrator | notadmin@example.com  | pass | pass          | admin@example.com  | false | 1   | 2|

  Given I am logged in as not_admin
  And I am on the students page

  Scenario: View classrooms
  Then I should see "Room A"
  And I should see "Room B"



