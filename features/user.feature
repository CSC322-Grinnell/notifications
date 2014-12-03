Feature: create an administrative user  (not yet implemented)

  As a sys admin.
  I want to be able to create an administrative user
  So that I can have specific people 

Background: some users have been added to database

  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  |
  | Joanne Really | jojo@this.com      | jojo      | jojo                  | jojo@this.com      |
  | Lisa Snark    | snarky@sarcasm.com | snarks    | snarks                | snarky@sarcasm.com |
  | Jonny Apple   | apple@xxx.com      | apple     | apple                 | apple@xxx.com      |
  | Laddy Buck    | laddy@school.edu   | laddybuck | laddybuck             | laddy@school.edu   |

  And I am logged in as admin

Scenario: create an admin user
	
	And I am on the new user page
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "xxxxx@xxxxxx.com"
	And I fill in "user_password" with "cats"
	And I fill in "user_password_confirmation" with "cats"
	And I press "Register"
	Then I should be on the user page
	And I should see "Your account has been created."
	
Scenario: login (happy path)
 	And I am on the login page
 	And I fill in "user_session_email" with "admin@example.com"
 	And I fill in "user_session_password" with "pass"
 	And I press "Login"
 	Then I should see "Login successful!"

Scenario: attempt to access page when not logged in (sad path)
  Given I am not logged in
  And I am on the new user page
  Then I should see "You must be logged in to access this page"