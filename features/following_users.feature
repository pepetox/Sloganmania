Feature: One user can follow what other users publish.
   
Scenario: A user follow another user

Given A register user with username "plat161"
And A signed in user 
When I go to the home page
And I click in "Users"
And I click in "plat161"
And I click in "follow"
Then I should follow plat161