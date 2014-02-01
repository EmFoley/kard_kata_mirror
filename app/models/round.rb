class Round < ActiveRecord::Base
  validates :user_id, presence: true
  validates :deck_id, presence: true

  def is_finished?(deck)
    deck.card_count.zero? ? true : false
  end
end
