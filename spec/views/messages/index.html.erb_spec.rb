require 'rails_helper'

RSpec.describe "messages/index", :type => :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :content => "Content",
        :user => nil
      ),
      Message.create!(
        :content => "Content",
        :user => nil
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
