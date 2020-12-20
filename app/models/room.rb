class Room < ApplicationRecord
  belongs_to :user
  belongs_to :participate, class_name: 'User'
  has_many :messages
end
