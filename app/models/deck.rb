class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  validates :name, presence: true
  validates :user_id, presence: true
  validates :name, uniqueness: {scope: :user_id}
end
