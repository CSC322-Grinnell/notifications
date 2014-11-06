Feature: create a user  (not yet implemented)

  As a sys admin.
  I want to be able to create a user
  So that I can create a database of users

Background: some users have been added to database

  Given the following users exist:
  | first_name | last_name | user_type     | number     | email            | contact |
  | Joanne	   | Barnes    | administrator | 1112223333 | example@this.com |         |
  | Lisa       | Angle     | student       |            |                  | Tina    |
  | Jonny      | Beans     | parent        | 9998887777 | beans@xxx.com    |         |
  | Laddy      | Norms     | teacher       | 4445556666 | laddy@school.edu |         |

  And I am on the create_user page

Scenario: create a user
	When I fill in "aFirst_name" with "Alice"
	And I fill in "a Last_name" with "Walker"
	And I fill in "aNumber" with "2532363623"
	And I check "text"
	And I fill in "aContact" with "Leo"
	And I fill in "anEmail" with "xxxxx@xxxxxx.com"
	And I check "administrator"
	And I press "Create User"
	Then I should see "User Alice Walker created successfully"
	Then the following users should exist:
	| first_name | last_name | user_type     | number     | email            | contact |
  	| Joanne	 | Barnes    | administrator | 1112223333 | example@this.com |         |
  	| Lisa       | Angle     | student       |            |                  | Tina    |
  	| Jonny      | Beans     | parent        | 9998887777 | beans@xxx.com    |         |
 	| Laddy      | Norms     | teacher       | 4445556666 | laddy@school.edu |         |
 	| Alice      | Walker    | administrator | 2532363623 | xxxxx@xxxxxx.com |         |
