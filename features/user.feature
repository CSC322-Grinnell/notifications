Feature: create an administrative user

  As a sys admin.
  I want to be able to create an administrative user
  So that I can have specific people

Background: some users have been added to database

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  | true  |
  | Joanne Really | jojo@this.com      | jojo      | jojo                  | jojo@this.com      | false |
  | Lisa Snark    | snarky@sarcasm.com | snarks    | snarks                | snarky@sarcasm.com | false |
  | Jonny Apple   | apple@xxx.com      | apple     | apple                 | apple@xxx.com      | false |
  | Laddy Buck    | laddy@school.edu   | laddybuck | laddybuck             | laddy@school.edu   | false |

  And I am logged in as admin

Scenario: create an admin user
	Given I am logged in as admin
  	And I am on the new user page
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "xxxxx@xxxxxx.com"
	And I fill in "user_password" with "cats"
	And I fill in "user_password_confirmation" with "cats"
	And I press "Register"
	Then I should be on the users page
	And I should see "Alice Walker"
  And I should see "xxxxx@xxxxxx.com"

Scenario: login (happy path)
 	And I am on the login page
 	And I fill in "user_session_email" with "admin@example.com"
 	And I fill in "user_session_password" with "pass"
 	And I press "Log In"
 	Then I should see "History"
  And I should see "Edit Data"
  And I should see "Send a Message"
  And I should see "User"

Scenario: attempt to access page when not logged in (sad path)
  Given I am not logged in
  And I am on the new user page
  Then I should see "Email"
  And I should see "Password"
  And I should see "Remember me"

Scenario: delete last admin attempt
  Given I am logged in as admin
  And I am on the users page
  And I remove admin
  And I confirm the popup
  Then I should be on the users page
  And I should not see "userAdministrator"
  #Then I should see "Unable to delete the last admistrator."


Scenario: change password
	Given I am logged in as admin
	And I am on the edit user page for "Administrator"
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "Example2@admin.com"
	And I fill in "user_password" with "dogs"
	And I fill in "user_password_confirmation" with "dogs"
	And I press "Update User Info"
	Then I should be on the users page
  And I should see "Alice Walker"
	And I should see "Example2@admin.com"

Scenario: Passwords not the same
	Given I am logged in as admin
	And I am on the edit user page for "Administrator"
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "Example2@admin.com"
	And I fill in "user_password" with "dogs"
	And I fill in "user_password_confirmation" with "cats"
	And I press "Update User Info"
	Then I am on the edit user page for "Administrator"
	#And I should see "Passwords aren't the same"
