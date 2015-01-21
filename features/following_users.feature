Feature: One user can follow what other users publish.
   
Scenario: A user follow another user from the another user page

Given A registered user with username "platform161"
And A signed in user 
When I go to the home page
And I click in "Users"
And I click in "platform161"
And I press "Follow"
Then I should see "my slogan number 2"