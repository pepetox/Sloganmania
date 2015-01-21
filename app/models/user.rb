class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  validates_presence_of :username
  has_many :messages, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  
  def follow(another_user)
    active_relationships.create(followed_id: another_user.id)
  end

  def unfollow(another_user)
    active_relationships.find_by(followed_id: another_user.id).destroy
  end

  def following?(another_user)
    following.include?(another_user)
  end

  
end
