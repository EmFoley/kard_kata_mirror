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

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def stats
    {times_played: times_played_each_deck, last_played: last_played_each_deck, high_score: high_score_each_deck}
  end

  def times_played_each_deck
    result = {}
    self.decks.each do |deck|
      result[deck.id] = deck.rounds.length
    end
    result
  end

  def high_score_each_deck
    result = {}
    self.decks.each do |deck|
      if deck.rounds.empty?
        result[deck.id] = {correct: 0}
      else
        result[deck.id] = deck.rounds.map{ |round| round.score }.max
      end
    end
    result
  end

  def last_played_each_deck
    result = {}
    self.decks.each do |deck|
      begin
        date = deck.rounds.order('created_at desc').first.created_at
        result[deck.id] = date.strftime("%m/%d/%Y")
      rescue
        result[deck.id] = 'Never'
      end
    end
    result
  end
end