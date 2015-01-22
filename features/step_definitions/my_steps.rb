Given(/^A signed in user$/) do
  @user = create(:user)
  login_as(@user)  
end

Given(/^A registered user with username "(.*?)"$/) do |arg1|
  @another_user = create(:user, username: arg1) 
  create_list(:message, 3, user: @another_user)
end

Given(/^A unsigned in user$/) do
  logout
end

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)  
end

Given(/^A registered user with slogans$/) do
  @another_user_with_slogans = create(:user, username: 'plat161')
  create_list(:message, 30, user: @another_user_with_slogans)

end

Given(/^The singed user follow the other user$/) do
  @user.follow(@another_user_with_slogans)
end

Given(/^Another registered user with username "(.*?)" is following "(.*?)"$/) do |arg1, arg2|
  @followeruser = create(:user, username: arg1) 
  @followeruser.follow(@another_user)
 
end

When(/^I go to (.+)$/) do |page_name|
  visit path_to(page_name)  
end

When (/^(?:|I )press "([^"]*)"$/) do |button|
  click_button(button)
end

When (/^(?:|I )click in "([^"]*)"$/) do |link|
  click_link(link)   
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When(/^I click in the icon "(.*?)"$/) do |icon|
  puts page.find(".#{icon}")
end
When /^I submit the form$/ do
  page.evaluate_script("document.forms[0].submit()")
end

When(/^comes a request for the messages of an user$/) do
  @response = get '/sloganers/plat161/messages.json' 
end

When(/^comes a request for the followers of the first user$/) do
  @response = get '/sloganers/plat161/followers.json' 
end

When(/^comes a request for the following of the "(.*?)"$/) do |arg1|
  @response = get '/sloganers/media161/following.json'
end

Then(/^the API answer a JSON with the following of that user$/) do
  @response.status.should eq(200)
   @response.content_type.should eq('application/json; charset=utf-8')
end
Then(/^the API answer a JSON with the messages of that user$/) do
   # express the regexp above with the code you wish you had
   @response.status.should eq(200)
   @response.content_type.should eq('application/json; charset=utf-8')
   @response.body.should eq(@another_user_with_slogans.messages.to_json)
end

Then(/^the API answer a JSON with the followers of that user$/) do
  @response.status.should eq(200)
  @response.content_type.should eq('application/json; charset=utf-8')
end

Then (/^(?:|I )should be on (.+)$/) do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then(/^I should go to (.*?) page$/) do |arg1|
  if(arg1 == "my customer")
    visit customer_path(@cliente)
  end
end

Then(/^I should see field "(.*?)" of "(.*?)"$/) do |arg2, arg1|
  if page.respond_to? :should
    page.should have_content(@arg1.send(arg2).to_s)
  else
    assert page.has_content?(@arg1.send(arg2).to_s)
  end
end

Then(/^I should see user email$/) do 
    if page.respond_to? :should
    page.should have_content(@user.email.to_s)
  else
    assert page.has_content?(@user.email.to_s)
  end
end




Then (/^(?:|I )should see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


Then (/^show me the page$/) do
  save_and_open_page
end


Then (/^(?:|I )should not see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

When(/^I choose "(.*?)" in "(.*?)"$/) do |arg1, arg2|
  
  page.select(arg1, :from => arg2)
  
end


Then(/^I should see icon "(.*?)"$/) do |arg1|
   page.find('span.mostrar').should be_present
end

Then /^"([^"]*)" should be selected for "([^"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
  with_scope(selector) do
    field_labeled(field).find(:xpath, ".//option[@selected = 'selected'][text() = '#{value}']").should be_present
  end
end



Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
  page.driver.response.headers['Content-Disposition'].should eq ("filename=\"#{filename}\"")  
end

Then(/^I should have one message published$/) do
  
  @user.messages.size.should eq(1)
end

Then(/^I should not have any message published$/) do
  @user.messages.size.should eq(0)
end

Then(/^I should follow (\d+) user$/) do |arg1|
  #@user.following.include?(@another_user).should eq(true)
  @user.following.size.should eq(1)
end

Then(/^I should see that slogans$/) do
  @another_user_with_slogans.messages.each do |message|
    if page.respond_to? :should
      page.should have_content(message.content)
    else
      assert page.has_content?(message.content)
    end
  end
end