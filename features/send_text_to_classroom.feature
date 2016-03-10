Feature: Send a text to all members of a classroom

  As an administrator
  so that teachers can notify one class at a time
  I would like to send texts to all members of a classroom

  Background: there are students and classrooms in the database

  Given the following classrooms exist:
  | name |
  | Room A    |
  | Room B    |

  Given the following students exist:
  | Student_Name | Parent_Name | Phone_Number | Email                      | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | 1    |
  | Lady         | Ralf        | 2532363623   | teamfirealarm@gmail.com    | 1    |
  | Rachel       | Papa        | 2532363623   | potato@gmail.com           | 2    |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  | true  |

  Given I am logged in as admin
  And I am on the classroom page

  Scenario: Send text to all students within a classroom
  Given I am on the classrooms page
  When I follow "Room A"
  And I follow "Text Classroom"
  Then I should be on the text page
  Then the "aNum" field should contain "Khoa Nguyen, Lady"
  And I fill in "aMessage" with "This is a test"
  And I press "Send!"
  Then I should see "Messages sent successfully."