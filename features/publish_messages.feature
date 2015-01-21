Feature: One user can publish messages no longer than 160 characters.
   
Scenario: A login user can publish a message of less 160 characters

   Given A signed in user 
   When I go to the home page
   And I click in "Publish new slogan"
  And I fill in "message[content]" with "Adidas: Impossilbe is nothing" 
   And press "Create Message"
   Then I should be on home page 
   And I should have one message published
   And I should see "Message was successfully published."


Scenario: A login user can't publish a message if is longer than 160 characters

   Given A signed in user 
   When I go to the home page
   And I click in "Publish new slogan"
   And I fill in "message[content]" with "Adidas: There are a lot of incredible difficult things in this live but if you go to the store and buy adidas products then you feel like you can do everything in this world. Of course is an ilusion but the feeling is great so let´s buy some of this brand" 
   And press "Create Message"
   Then I should be on the messages page 
   And I should not have any message published
   And I should see "Content 160 characters is the maximum allowed Message"

