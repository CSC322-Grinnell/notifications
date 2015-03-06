Feature: Group stuents into classrooms

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
  | Student_Name | Parent_Name | Phone_Number | Email                      | classroom_name |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | Room A    |
  | Lady         | Ralf        | 2532363623   | teamfirealarm@gmail.com    | Room A    |
  | Rachel       | Papa        | 2532363623   | potato@gmail.com           | Room B    |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  |

  Given I am logged in as admin
  And I am on the classrooms page

  Scenario: Create a classroom
  When I follow "Add New Classroom"
  And I fill in "classroom_name" with "Avengers"
  And I press "Save"
  And I follow "Back"
  Then I should be on the classrooms page
  And I should see "Avengers"

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

  Scenario: Put students in classroom
  Given I am on the details page for "Khoa Nguyen"
  When I follow "Edit"
  And I select "Room A" from "Classroom name"
  And I press "Save"
  Then I should see "Room A"
