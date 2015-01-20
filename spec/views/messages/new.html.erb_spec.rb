require 'rails_helper'

RSpec.describe "messages/new", :type => :view do
  before(:each) do
    assign(:message, Message.new(
      :content => "MyString",
      :user => nil
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_content[name=?]", "message[content]"

      assert_select "input#message_user_id[name=?]", "message[user_id]"
    end
  end
end
