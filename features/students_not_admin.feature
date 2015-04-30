Feature: Create, read, update, and delete students

  As a teacher 
  So that I can manage the database of students
  I want to create, read, update, and delete students.

Background: there is a student in the database
  Given the following classrooms exist:
  | name |
  | Room |
  | Party |

  Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                      | can_text | classroom_name |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | true     |Room |

  Given the following users exist:
  | name             | email                 | password  | password_confirmation | login              | admin |
  | NotAdministrator | notadmin@example.com  | pass      | pass                  | admin@example.com  | false |

  Given I am logged in as not_admin
  And I am on the students page


Scenario: Read a student (happy path)
  When I follow "Show Khoa Nguyen"
  Then I should be on the details page for "Khoa Nguyen"
  And I should see "teamfirealarm@gmail.com"


Scenario: Find edit button missing
  Given I am on the details page for "Khoa Nguyen"
  Then I should not see "Edit"

Scenario: Find delete button missing
  Given I am on the details page for "Khoa Nguyen"
  Then I should not see "Delete"
