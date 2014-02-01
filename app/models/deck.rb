class Deck < ActiveRecord::Base
  # def initialize(params)
  #   super
  #   @deck = generate_deck
  #   @deck.shuffle!
  # end

  def generate_card_array
    Cards.where(deck_id: self.id)
  end

  def top_card(deck_array)
    deck_array.pop
  end

  def card_count
    @deck.count
  end
end
