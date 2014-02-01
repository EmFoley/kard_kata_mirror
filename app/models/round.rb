class Round < ActiveRecord::Base
  def is_finished?(deck)
    deck.card_count.zero? ? true : false
  end
end
