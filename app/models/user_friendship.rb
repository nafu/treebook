class UserFriendship < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'


  attr_accessible :user, :friend, :user_id, :friend_id

  state_machine :state, :initial => :pending do
  end
end
