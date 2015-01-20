 Feature: An user can register using his email, a selected password and an user name. The user name has to be unique.
# Scenario: Success Log In

#  Given A signed in user
#   When I go to the home page
#   Then I should be on home page
#    And I should see user email 
  
# Scenario: No logged user can´t see main page

#  Given A unsigned in user
#   When I go to the home page
#   Then I should be on the sign_in page
   
Scenario: An user can register using his email, a selected password and an user name

  Given A unsigned in user
  When I go to the home page
  And I click in "New user"
  And I fill in "email" with "myname@mycompany.com"
  And I fill in "password" with "secret"
  And I fill in "username" with "myname"
  And click in "Sign up"


