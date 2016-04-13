Feature: Navbar functionality

  As a user
  So that I can navigate to different pages
  I would like to use the navbar

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin | classroom_ids |
  | NotAdministrator | notadmin@example.com  | pass      | pass                  | admin@example.com  | false | 1 |

  Given the following classrooms exist:
   | name | 
  | Avengers    |
  | Room A   |
  | Room B |


  Given I am logged in as not_admin
  And I am on the classrooms page

  Scenario: View the items in the navbar
  Then I should see "History"
  And I should see "Edit Data"
  And I should see "Students"
  And I should see "Classroom"
  And I should see "Users"
  And I should see "Send Message"
  And I should see "User"
  And I should see "Settings"
  And I should see "Logout"

  Scenario: Navigate to different pages
  And I follow "Students"
  Then I should be on the students page
