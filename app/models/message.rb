class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true
  validates :body, presence: true, length: { maximum: 255 }
end
