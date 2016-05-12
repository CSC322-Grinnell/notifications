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
  | Khoa Nguyen  | Jason Liu   | 5005550006  | teamfirealarm@gmail.com    | 1    |
  | Crusty Jones  | Spice   | 5005550006   | teamfirealarm@gmail.com    | 2    |
  | Sultan Lust  | Everything Nice   | 5005550006   | teamfirealarm@gmail.com    | 1    |
  | Czar Lust  | Jason Liu   | 5005550006   | teamfirealarm@gmail.com    | 2    |
  | Butt Plugly  | Jason Liu   | 5005550006   | teamfirealarm@gmail.com    | 2    |
  | Princess Lust  | Lump Son  | 5005550006  | teamfirealarm@gmail.com    | 3    |

 
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
  And I should not see "Room C"

Scenario: View students
  Then I should see "Khoa Nguyen"
  And I should see "Crusty Jones"
  And I should see "Sultan Lust"
  And I should see "Czar Lust"
  And I should not see "Princess Lust"


Scenario:Select single recipient and template send message
  When I check "Butt Plugly"
  And I click "Head Start class is cancelled"
  And I press "submit-button-right-side"
  Then I should be on the history page
  And I should see "Head Start class is cancelled"
  And I should see "Butt Plugly"


Scenario:Select single recipient and custom send message
  When I check "Butt Plugly"
  And I press "Write a Custom Message"
   And I fill in "msg-text" with "this single recipient custom message"
  And I press "submit-button-right-side"
  Then I should be on the history page
  And I should see "this single recipient custom message"
  And I should see "Butt Plugly"

Scenario: Select multiple recipients and send a custom message
  When I check "Butt Plugly"
  And I check "Crusty Jones"
  And I press "Write a Custom Message"
  And I fill in "msg-text" with "this is a test"
  And I press "submit-button-right-side"
  Then I should be on the history page
  And I should see "this is a test"
  And I should see "Butt Plugly"
  And I should see "Crusty Jones"

Scenario: Select classrooms and send a custom message
  When I check "recipients-select-all-RoomA"
  And I check "recipients-select-all-RoomA"
  And I press "Write a Custom Message"
  And I fill in "msg-text" with "this is a classroom test"
  And I press "submit-button-right-side"
  Then I should be on the history page
  And I should see "this is a classroom test"

Scenario: Select classrooms and send a template message
  When I check "recipients-select-all-RoomA"
  And I check "recipients-select-all-RoomA"
  And I click "Classes are closing early today due to weather."
  And I press "submit-button-right-side"
  Then I should be on the history page
  And I should see "this is a classroom test"

Scenario: Check for message in history
  When I check "Czar Lust"
  And I press "Write a Custom Message"
  And I fill in "msg-text" with "this is a test"
  And I press "submit-button-right-side"
  Then I should see "this is a test"
  Then I should be on the history page
  And I should see "Czar Lust"
  And I should see "Administrator"

  Scenario: Text input is too long
    When I check "Czar Lust"
    And I fill in "msg-text" with "Love life Fionn met his most famous wife, Sadhbh, when he was out hunting. She had been turned into a deer by a druid, Fear Doirich, whom she had refused to marry. Fionn's hounds, Bran and Sceólang, born of a human enchanted into the form of a hound, recognised her as human, and Fionn brought her home. She transformed back into a woman the moment she set foot on Fionn's land, as this was the one place she could regain her true form. She and Fionn married and she was soon pregnant. When Fionn was away defending his country, Fear Doirich (literally meaning Dark Man) returned and turned her back into a deer, whereupon she vanished. Fionn spent years searching for her, but to no avail. Bran and Sceólang, again hunting, found her son, Oisín, in the form of a fawn; he transformed into a child, and went on to be one of the greatest of the Fianna. In The Pursuit of Diarmuid and Gráinne the High King Cormac mac Airt promises the ageing Fionn his daughter Gráinne, but at the wedding feast Gráinne falls for one of the Fianna, Diarmuid Ua Duibhne, noted for his beauty. She forces him to run away with her and Fionn pursues them. The lovers are helped by the Fianna, and by Diarmuid's foster-father, the god Aengus. Eventually Fionn makes his peace with the couple. Years later, however, Fionn invites Diarmuid on a boar hunt, and Diarmuid is gored. Water drunk from Fionn's hands has the power of healing, but each time Fionn gathers water he lets it run through his fingers before he gets back to Diarmuid. His grandson Oscar shames Fionn, but when he finally returns with water it is too late; Diarmuid has died.Death[edit]According to the most popular account of Fionn's death, he is not dead at all, rather, he sleeps in a cave, surrounded by the Fianna. One day they will awake and defend Ireland in the hour of her greatest need. In one account, it is said they will arise when the Dord Fiann, the hunting horn of the Fianna, is sounded three times, and they will be as strong and as well as they ever were."
  And I press "submit-button-right-side"
  Then I should see "Message text too long"

  Scenario: No recipients custom message
    When I fill in "msg-text" with "this is a sad test"
    And I press "submit-button-right-side"
    Then I should be on the text page


  Scenario: No recipients custom message
    #When I press "Write a Custom Message"
    When I fill in "msg-text" with "this is a sad test"
    And I press "submit-button-right-side"
    Then I should be on the text page

  Scenario: No recipients templated message
    When I click "Classes are closing early today due to weather."
    And I fill in "msg-text" with "this is a sad test"
    And I press "submit-button-right-side"
    Then I should be on the text page

  Scenario: No message text
    When I check "Czar Lust"
    And I press "submit-button-right-side"
    Then I should be on the text page

  Scenario:Select single recipient and template send message with input
    When I check "Butt Plugly"
    And I click "No class on ____ day"
    And I fill in "messageinput" with "09/02/93"
    And I press "submit-button-right-side"
    Then I should be on the history page
    And I should see "Head Start class is cancelled"
    And I should see "Butt Plugly"







