Feature: API access to allow See one user messages. See the users followed by one user. See the users that follow one user.
   
Scenario: public API allow get messages from a user 

Given A registered user with slogans
When comes a request for the messages of an user
Then the API answer a JSON with the messages of that user

Scenario: public API allow get followers from a user 

Given A registered user with username "platform161"
And Another registered user with username "media161" is following "platform161"
When comes a request for the followers of the first user
Then the API answer a JSON with the followers of that user


Scenario: public API allow get following to a user 

Given A registered user with username "platform161"
And Another registered user with username "media161" is following "platform161"
When comes a request for the following of the "media161"
Then the API answer a JSON with the following of that user


