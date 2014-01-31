class Deck < ActiveRecord::Base
  def initialize(params)
    super
    @deck = generate_deck
    @deck.shuffle!
  end

  def generate_deck(deck_id)
    Cards.where(deck_id: deck_id)
  end

  def top_card
    @deck.pop
  end

  def card_count
    @deck.count
  end
end
