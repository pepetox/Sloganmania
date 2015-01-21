Feature: One user can follow what other users publish.
   
Scenario: A user follow another user from the another user page

Given A register user with username "plat161"
And A signed in user 
When I go to the home page
And I click in "Users"
Then show me the page
And I click in "plat161"
And I press "Follow"
Then I should follow 1 user