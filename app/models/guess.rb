class Guess < ActiveRecord::Base
  def correct?(guess)
    outcome = Card.where(:answer => guess)
    outcome.empty? ? false : true
  end
end
