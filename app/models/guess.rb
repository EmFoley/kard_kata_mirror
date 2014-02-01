class Guess < ActiveRecord::Base
  validates :round_id, presence: true
  validates_inclusion_of :outcome, in: [true, false]
  validates :card_id, presence: true
end
