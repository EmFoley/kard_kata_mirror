class User < ActiveRecord::Base
  has_many :decks
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
end
