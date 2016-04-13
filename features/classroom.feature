Feature: Group students into classrooms

  As an administrator
  so that teachers can notify one class at a time
  I would like to be able to group students into classes

  Background: there are students in the database

  Given the following classrooms exist:
  | name |
  | Avengers    |
  | Room A   |
  | Room B |

  Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                     | can_text | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com   | true     | 1        |
  | Lady         | Ralf        | 2532363623   | teamfirealarm@gmail.com   | true     | 1         |
  | Rachel       | Papa        | 2532363623   | potato@gmail.com          | true     | 1         |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  | true  |

  Given I am logged in as admin
  And I am on the classrooms page


  Scenario: Create a classroom
  When I follow "Add New Classroom"
  And I fill in "classroom_name" with "Roomie"
  And I press "Save"
  And I follow "Back"
  Then I should be on the classrooms page
  And I should see "Roomie"

  Scenario: Delete a classroom
  Given I am on the classroom details page for "Avengers"
  When I follow "Delete"
  And I confirm the popup
  Then I should be on the classroom page
  And I should not see "Avengers"

  Scenario: List all classrooms
  Given I am on the classrooms page
  Then I should see "Room A"
  And I should see "Room B"
  And I should see "Avengers"

  Scenario: Put students in classroom
  Given I am on the edit page for "Khoa Nguyen"
  And I check "Room B"
  And I press "Save"
  Then I should see "Room B"
