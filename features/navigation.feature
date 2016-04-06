Feature: Navbar functionality

  As a user
  So that I can navigate to different pages
  I would like to use the navbar

  Given the following users exist:

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin | classroom_ids |
  | NotAdministrator | notadmin@example.com  | pass      | pass                  | admin@example.com  | false | 3 |

  Given I am logged in as not_admin
  And I am on the classrooms page

  Scenario: View the items in the navbar
  Given I am on the classrooms page
  Then I should not see "History"
  And I should not see "Edit Data"
  And I should not see "Students"
  And I should not see "Classroom"
  And I should not see "Users"
  And I should not see "Send Message"
  And I should not see "User"
  And I should not see "Settings"
  And I should not see "Logout"
