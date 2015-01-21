Feature: Everyone can see the followers and following by any user.
   
Scenario: A unlogged user can see that one user is following another

Given A registered user with username "platform161"
And Another registered user with username "media161" is following "platform161"
And A unsigned in user
When I go to the home page
And I click in "Users"
And I click in "media161"
Then I should see "Folowing to: platform161"

Scenario: A unlogged user can see that one user has followers

Given A registered user with username "platform161"
And Another registered user with username "media161" is following "platform161"
And A unsigned in user
When I go to the home page
And I click in "Users"
And I click in "platform161"
Then I should see "Followed by: media161"