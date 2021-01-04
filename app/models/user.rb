class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :age, presence: true, length: { maximum: 5 } 
  validates :baseball_experience, presence: true, length: { maximum: 50 }
  has_secure_password
  
  def is_finished?
      self.team_informations.include?(is_finished: 'true')
  end
  
  has_many :team_informations
  has_many :rooms
  has_many :participatings, through: :rooms, source: :participate
  has_many :reverses_of_room, class_name: 'Room', foreign_key: 'participate_id'
  has_many :participateds, through: :reverses_of_room, source: :user
  has_many :messages
  
  def participate(other_user)
    unless self == other_user
      self.rooms.find_or_create_by(participate_id: other_user.id)
    end
  end
  
  
  def participate?(other_user)
    self.participatings.include?(other_user)
  end
  
end
