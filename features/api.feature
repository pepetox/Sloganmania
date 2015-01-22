Feature: API access to allow See one user messages. See the users followed by one user. See the users that follow one user.
   
Scenario: public API allow get messages from a user 

Given A registered user with slogans
When comes a request for the messages of an user
Then the API answer a JSON with the messages of that user


