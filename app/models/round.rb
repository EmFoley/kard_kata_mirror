class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  validates :user_id, presence: true
  validates :deck_id, presence: true

  def is_finished?(deck)
    deck.card_count.zero? ? true : false
  end

  def score
    num_correct = self.guesses.where(outcome: 1).length
    num_incorrect = self.guesses.where(outcome: 0).length
    {correct: num_correct, incorrect: num_incorrect}
  end
end
