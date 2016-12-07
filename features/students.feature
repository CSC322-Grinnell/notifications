Feature: Create, read, update, and delete students

  As a teacher 
  So that I can manage the database of students
  I want to create, read, update, and delete students.

Background: there is a student in the database
  Given the following classrooms exist:
  | name |
  | Room |
  | Party |
  
  Given the following contacts exist:
  | Name      | Phone_Number  | Email          | language | can_text  |
  | Uzo Nwike | 5159916928    | uzo@email.com  | English  | true      |

  Given the following students exist:
  | student_name |
  | Adam Hudson  |
  
  #Given the following students_classrooms exist:
    
  #| Student       | Classrooms                |
  #| Adam Hudson   | Room                      |

  Given the following users exist:

  | name          | email              | password  | password_confirmation | login              | admin |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  | true  |

  Given I am logged in as admin
  And I am on the students page

Scenario: Create a student (with contact)
  When I follow "Add New Student"
  And I fill in "Student Name *" with "Wayne Rooney"
  And I check "Room"
  And I check "Uzo Nwike"
  And I press "Save"
  Then I should be on the details page for "Wayne Rooney"
  And I should see "Wayne Rooney"

Scenario: Create a student (without contact)
  When I follow "Add New Student"
  And I fill in "Student Name *" with "Alexis Sanchez"
  And I check "Party"
  And I press "Save"
  Then I should be on the new contact page

Scenario: Read a student (happy path)
  When I follow "Adam Hudson"
  Then I should be on the details page for "Adam Hudson"
  #And I should see "Room"
  And I should see "Uzo Nwike"

Scenario: Update a student (happy path)
  Given I am on the details page for "Adam Hudson"
  When I follow "Edit Adam Hudson"
  And I fill in "Name" with "Niko Takayesu"
  And I press "Save"
  Then I should be on the details page for "Niko Takayesu"


Scenario: Delete a student (happy path)
  Given I am on the details page for "Khoa Nguyen"
  When I follow "Delete"
  And I confirm the popup
  When I should be on the students page
  And I should not see "Khoa Nguyen"


Scenario: Enter an entry without student name (sad path)
  When I follow "Add New Student"
  And I fill in "Parent Name *" with "Luke Shaw"
  And I press "Save"
  And I should see "Student name can't be blank"
  And I follow "Back"
  Then I should be on the students page

