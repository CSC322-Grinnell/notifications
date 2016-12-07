Feature: Send a text to student from show page

  As an administrator
  so that teachers can notify one student
  I would like to send a text from the show student page

  Background: there are students and classrooms in the database

  Given the following classrooms exist:
  | name |
  | Room A    |
  | Room B    |

  Given the following students exist:
  | student_name | Parent_Name | Phone_Number | Email                      | classroom_ids |
  | Khoa Nguyen  | Jason Liu   | 2532363623   | teamfirealarm@gmail.com    | 1    |
  | Lady         | Ralf        | 2532363623   | teamfirealarm@gmail.com    | 1    |
  | Rachel       | Papa        | 2532363623   | potato@gmail.com           | 2    |

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  | true  |

  Given I am logged in as admin
  Given I am on the details page for "Lady"

  Scenario: Send text to a student from edit page
  And I follow "Send Text"
  Then I should be on the text page
  Then the "aNum" field should contain "Lady"
  And I fill in "aMessage" with "This is a test"
  And I press "Send!"
  Then I should see "Message sent successfully."
