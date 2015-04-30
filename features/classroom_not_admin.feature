Feature: Group stuents into classrooms as a techer

  As a teacher
  I would like to be able to view and text classrooms with students

  Background: there are students in the database

  Given the following classrooms exist:
  | name |
  | Avengers    |
  | Room A   |
  | Room B |

  Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                     | can_text | classroom_name |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com   | true     | Room A         |
  | Lady         | Ralf        | 2532363623   | teamfirealarm@gmail.com   | true     | Room A         |
  | Rachel       | Papa        | 2532363623   | potato@gmail.com          | true     | Room A         |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin |
  | NotAdministrator | notadmin@example.com  | pass      | pass                  | admin@example.com  | false |

  Given I am logged in as not_admin
  And I am on the classrooms page

  Scenario: View options available in classroom page
  Given I am on the classrooms page
  Then I should not see "Add New Classroom"
  And I should not see "Remove"

  Scenario: View options available in classroom details page
  Given I am on the classroom details page for "Avengers"
  Then I should not see "Add New Classroom"
  And I should see "Text Classroom"
  And I should not see "Delete"


  Scenario: List all classrooms
  Given I am on the classrooms page
  Then I should see "Room A"
  And I should see "Room B"
  And I should see "Avengers"

w