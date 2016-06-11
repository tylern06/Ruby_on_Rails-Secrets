class Secret < ActiveRecord::Base
  belongs_to :user
  #refers to likes model (many to many relationship)

  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
  validates :content, presence: true
end
