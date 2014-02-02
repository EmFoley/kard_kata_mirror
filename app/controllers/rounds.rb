get '/round' do
  unless session[:game_started]
    cards = Card.where(deck_id: params[:deck_id])
    session[:card_ids] = cards.map{ |card| card.id }
  end

  if session[:card_ids].empty?
    redirect '/results'
  end

  session[:game_started] = true if session[:game_started].nil?
  deck_id = params[:deck_id]
  @current_card = Card.find(session[:card_ids].first)
  @message = session[:answer_message]
  erb :round
end

post '/round' do
  guess = params[:user_answer]
  if Card.find(session[:card_ids].first).answer == guess
    outcome = true
    session[:answer_message] = "Congratulations! That is correct."
    session[:card_ids].shift
  else
    outcome = false
    session[:answer_message] = "Sorry, that was not correct :("
    session[:card_ids].rotate!
  end
  # Guess.create(round_id: params[:round_id], outcome: outcome, card_id:)
  redirect '/round'
end

get '/results' do
  erb :results
end