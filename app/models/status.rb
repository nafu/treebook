class Status < ActiveRecord::Base
  attr_accessible :content, :user_id

  validates :content, presence: true,
                      length: { minimum: 2 }

  validates :user_id, presence: true
  
  belongs_to :user
end
