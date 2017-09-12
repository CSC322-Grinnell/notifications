Feature: Group students into classrooms as a teacher

  As a teacher
  I would like to be able to view and text classrooms with students

  Background: there are students in the database

  Given the following classrooms exist:
  | name |
  | Avengers    |
  | Room A   |
  | Room B |

  Given the following students exist:
  | student_name | Parent_Name | Phone_Number | Email                     | can_text | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com   | true     | 2       |
  | Lady         | Ralf        | 2532363623   | teamfirealarm@gmail.com   | true     | 2         |
  | Rachel       | Papa        | 2532363623   | potato@gmail.com          | true     | 2         |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin | classroom_ids |
  | NotAdministrator | notadmin@example.com  | pass      | pass                  | admin@example.com  | false | 3 |

  Given I am logged in as not_admin
  And I am on the classrooms page

  Scenario: View options available in classroom page
  Given I am on the classrooms page
  Then I should not see "Add New Classroom"
  And I should not see "Remove"

  Scenario: View options available in classroom details page
  Given I am on the classroom details page for "Room B"
  Then I should not see "Add New Classroom"
  And I should see "Text Classroom"
  And I should not see "Delete"


  Scenario: List all classrooms
  Given I am on the classrooms page
  Then I should see "Room B"
  And I should not see "Avengers"
