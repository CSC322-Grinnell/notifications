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
  | name          | email              | password  | password_confirmation | login         |    admin   | 
  | NotAdministrator | notadmin@example.com  | pass | pass          | admin@example.com  | false | 

  
  Given the following classrooms_users exist:
  |classroom_id| user_id|
  | 1| 1|
  | 2| 1|


  Given I am logged in as not_admin
  And I am on the students page

  Scenario: View classrooms
  Then I should see "Room A"
  And I should see "Room B"



