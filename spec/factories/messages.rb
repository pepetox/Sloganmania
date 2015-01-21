FactoryGirl.define do
  factory :message do
    sequence(:content) { |n| "my slogan number #{n}" }
    user 
  end

end
