Feature: Navbar functionality

  As a user
  So that I can navigate to different pages
  I would like to use the navbar

  Background: We are on the website

  Given the following classrooms exist:
  | name |
  | Avengers |
  | Room A  |
  | Room B |

  Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                     | can_text | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com   | true     | 1        |
  | Lady         | Ralf        | 2532363623   | teamfirealarm@gmail.com   | true     | 1         |
  | Rachel       | Papa        | 2532363623   | potato@gmail.com          | true     | 2         |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin |
  | NotAdministrator | notadmin@example.com  | pass      | pass                  | admin@example.com  | false |


  Given I am logged in as not_admin
  And I am on the text page
  

  Scenario: View the items in the navbar
  Then I should see "History"
  And I should not see "Edit Data"
  And I should not see "Students"
  And I should not see "Classrooms"
  And I should not see "Users"
  And I should see "Send a Message"
  And I should see "User"
  And I should see "Settings"
  And I should see "Logout"



  Scenario: Navigate to Send Message page
  When I follow "Send a Message"
  Then I should be on the text page

  Scenario: Navigate to History page
  When I follow "History"
  Then I should be on the history page

  Scenario: Navigate to Settings page
  When I follow "Settings"
  Then I should be on the settings page

  Scenario: Navigate to Logout page
  When I follow "Logout"
  Then I should be on the login page
  
