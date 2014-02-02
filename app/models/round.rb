class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses

  validates :user_id, presence: true
  validates :deck_id, presence: true

  def is_finished?(deck)
    deck.card_count.zero? ? true : false
  end

  def score
    correct = self.guesses.where(outcome: 1).length
    incorrect = self.guesses.where(outcome: 0).length
    {correct: correct, incorrect: incorrect}
  end
end
