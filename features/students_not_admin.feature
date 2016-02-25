Feature: View students

  As a teacher 
  So that I can see the database of students
  I want to read the students.

Background: there is a student in the database
  Given the following classrooms exist:
  | name |
  | Room |
  | Party |

  Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                      | can_text | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | true     |1 |

  Given the following users exist:
  | name             | email                 | password  | password_confirmation | login              | admin |
  | NotAdministrator | notadmin@example.com  | pass      | pass                  | admin@example.com  | false |

  Given I am logged in as not_admin
  And I am on the students page


Scenario: Read a student (happy path)
  When I follow "Show Khoa Nguyen"
  Then I should be on the details page for "Khoa Nguyen"
  And I should see "teamfirealarm@gmail.com"


Scenario: View student information and available options for me
  Given I am on the details page for "Khoa Nguyen"
  Then I should not see "Edit"
  And I should not see "Delete"
  And I should see "Back"
  And I should see "Send Text"
