Given(/^A signed in (.+)$/) do |user_type|
  @user = create(user_type)
  login_as(@user, :scope => :user)  
end

Given(/^A unsigned in user$/) do
  logout
end

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)  
end

Given(/^There is a (.+)$/) do |thing_name|
  @thing_name = create(thing_name.to_s)
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


