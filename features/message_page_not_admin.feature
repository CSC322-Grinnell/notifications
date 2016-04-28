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
  | Khoa Nguyen  | Jason Liu   | 15005550006  | teamfirealarm@gmail.com    | 1    |
  | Crusty Jones  | Spice   | 15005550006   | teamfirealarm@gmail.com    | 2    |
  | Sultan Lust  | Everything Nice   | 15005550006   | teamfirealarm@gmail.com    | 1    |
  | Czar Lust  | Jason Liu   | 15005550006   | teamfirealarm@gmail.com    | 2    |
  | Butt Plugly  | Jason Liu   | 15005550006   | teamfirealarm@gmail.com    | 2    |
  | Princess Lust  | Lump Son  | 15005550006  | teamfirealarm@gmail.com    | 3    |

 
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

Scenario: Select multiple recipients and send a message
  When I check "Butt Plugly"
  And I check "Crusty Jones"
  And I fill in "msg-text" with "this is a test"
  And I press "Send Message"
  Then I should see be on the history page
  And I should see "this is a test"

Scenario: Select classroom and send a message
  When I check "Room A"
  And I check "Room B"
  And I fill in "msg-text" with "this is a classroom test"
  And I press "Send Message"
  Then I should see be on the history page
  And I should see "this is a classroom test"

Scenario: Check for message in history
  When I check "Czar Lust"
  And I fill in "msg-text" with "this is a test"
  And I press "Send Message"
  And I follow "History"
  Then I should see "this is a test"


  #Scenario: Send failed





