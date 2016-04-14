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
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  | true  |

  Given I am logged in as admin
  And I am on the classrooms page



  Given I am logged in as admin
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
  And I follow "Classroom"
  Then I should be on the classrooms page
  And I follow "Users"
  Then I should be on the user edit page
  And I follow "Text"
  Then I should be on the text page
  And I follow 'Settings'
  Then I should be on the settings page
  And I follow 'Logout'
  Then I should be on the users_sessions/new page