helpers do

  def initialize_round
    new_round = Round.create(deck_id: params[:deck_id], user_id: session[:id])
    session[:card_ids] = Card.where(deck_id: params[:deck_id]).map{ |card| card.id }
    session[:round_id] = new_round.id
  end

end