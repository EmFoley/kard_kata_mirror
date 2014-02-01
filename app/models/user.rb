class User < ActiveRecord::Base
  # attr_accessor: user_entered_password
  has_many :decks
  has_many :cards, through: :decks

  has_many :rounds
  has_many :guesses, through: :rounds

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
  # validate :user_passwords_match

  # def user_passwords_match
  #   self.password == self.user_entered_password
  # end
end

