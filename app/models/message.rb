class Message < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { maximum: 160, too_long: "%{count} characters is the maximum allowed" }

end
