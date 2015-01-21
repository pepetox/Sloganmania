Feature: When the user accesses the application, he will see the messages published by the users he follow.
   
Scenario: A logged user can see the slogans of the sloganers that follow

Given A registered user with slogans
And A signed in user 
And The singed user follow the other user
When I go to the home page
Then I should see that slogans