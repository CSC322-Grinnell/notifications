Feature: create an administrative user

  As a sys admin.
  I want to be able to create an administrative user
  So that I can have specific people 

Background: some users have been added to database
  
  Given the following classrooms exist:
  |name|
  |The Sting|
  |The Butt |
  
  Given the following users exist:
  | name          | email              | password  | password_confirmation | login              | admin | classroom_ids |
  | Administrator | admin@example.com  | pass      | pass                  | admin@example.com  | true  |  |
  | Joanne Really | jojo@this.com      | jojo      | jojo                  | jojo@this.com      | false | 1 |
  | Lisa Snark    | snarky@sarcasm.com | snarks    | snarks                | snarky@sarcasm.com | false | 1 |
  | Jonny Apple   | apple@xxx.com      | apple     | apple                 | apple@xxx.com      | false | 2 |
  | Laddy Buck    | laddy@school.edu   | laddybuck | laddybuck             | laddy@school.edu   | false | 1 | 


  And I am logged in as admin

Scenario: create an admin user(happy path)
	Given I am logged in as admin
  	And I am on the new user page
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "xxxxx@xxxxxx.com"
	And I fill in "user_password" with "cats"
	And I fill in "user_password_confirmation" with "cats"
	And I check "Admin"
	And I press "Register"
	Then I should be on the user page
	And I should see "Your account has been created."

Scenario: create a non admin user(happy path)
	Given I am logged in as admin
	And I am on the new user page
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "xxxxx@xxxxxx.com"
	And I fill in "user_password" with "cats"
	And I fill in "user_password_confirmation" with "cats"
	Then I check "The Butt"
	And I press "Register"
	Then I should be on the user page
	And I should see "Your account has been created"
	
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

Scenario: delete last admin attempt
  Given I am logged in as admin
  And I am on the user page
  And I remove admin
  And I confirm the popup
  Then I should see "Unable to delete the last admistrator."


Scenario: change password
	Given I am logged in as admin
	And I am on the edit user page for "Administrator"
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "Example2@admin.com"
	And I fill in "user_password" with "dogs"
	And I fill in "user_password_confirmation" with "dogs"
	And I press "Update User Info"
	Then I should be on the user page
	And I should see "Account updated!"

Scenario: Passwords not the same
	Given I am logged in as admin
	And I am on the edit user page for "Administrator"
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "Example2@admin.com"
	And I fill in "user_password" with "dogs"
	And I fill in "user_password_confirmation" with "cats"
	And I press "Update User Info"
	Then I am on the edit user page for "Administrator"
	And I should see "Passwords aren't the same"