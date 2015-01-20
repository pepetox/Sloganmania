 Feature: An user can register using his email, a selected password and an user name. The user name has to be unique.
   
Scenario: An user can register using his email, a selected password and an not repeated username

  Given A unsigned in user
  When I go to the home page
  And I click in "New user"
  And I fill in "Email" with "myname@mycompany.com"
  And I fill in "Username" with "myname"
  And I fill in "Password" with "secretsecret"
  And I fill in "Password confirmation" with "secretsecret"
  And press "Sign up"
  Then I should be on home page 
  And I should see "myname@mycompany.com"



