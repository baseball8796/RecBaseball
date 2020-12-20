class TeamInformation < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 500 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :region, presence: true, length: { maximum: 30 }
  validates :recruiting_people, presence: true, length: { maximum: 30 }
  
  
end
