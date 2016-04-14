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
  | Sultan Lust  | Everything Nice   | 2532363623   | teamfirealarm@gmail.com    | 1    |
  | Czar Lust  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | 2    |
  | Princess Lust  | Lump Son  | 2532363623   | teamfirealarm@gmail.com    | 3    |

 
  Given the following users exist:
  | name          | email              | password  | password_confirmation | login         |    admin   | 
  | NotAdministrator | notadmin@example.com  | pass | pass          | admin@example.com  | false | 


  Given the following classrooms_users exist:
  |classroom_id| user_id|
  | 1| 1|
  | 2| 1|


  Given I am logged in as not_admin
  And I am on the text page

  Scenario: View classrooms
  Then I should see "Room A"
  And I should see "Room B"

  Scenario: View students
  Then I should see "Khoa Nguyen"
  And I should see "Crusty Jones"
  And I should see "Sultan Lust"
  And I should see "Czar Lust"
  And I should not see "Princess Lust"

  Scenario: Select recipients and send message
  Then I check "Sultan Lust"
  And I check "Crusty Jones"
  And I fill in "aMessage" with "this is a test"
  And I press "Send"
  Then I should see "Message sent successfully to Sultan Lust"

  Scenario: Select classroom and send it a message
  Then I check "Room A"
  And I check "Room B"
  And I fill in 'message' with 'this is a class test'
  And I press "Send"
  Then I should see "Message sent successfully to Class A, Class B"

  #Scenario: Fill in own number?

  #Scenario: Send failed





