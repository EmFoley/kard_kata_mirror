class Guess < ActiveRecord::Base
  belongs_to :round

  validates :round_id, presence: true
  validates_inclusion_of :outcome, in: [1, 0]
  validates :card_id, presence: true
end
