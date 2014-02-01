get '/round' do

  initialize_round unless session[:game_started]

  redirect '/results' if session[:card_ids].empty?

  session[:game_started] = true if session[:game_started].nil?
  deck_id = params[:deck_id]
  @current_card = Card.find(session[:card_ids].first)
  @message = session[:answer_message]
  erb :round
end

post '/round' do

  current_card = Card.find(session[:card_ids].first)
  if current_card.answer == params[:user_answer]
    outcome = 1
    session[:answer_message] = "Congratulations! That is correct."
    session[:card_ids].shift
  else
    outcome = 0
    session[:answer_message] = "Sorry, that was not correct :("
    session[:card_ids].rotate!
  end
  guess = Guess.create!(round_id: session[:round_id], outcome: outcome, card_id: current_card.id)
  p guess
  redirect '/round'
end

get '/results' do
  erb :results
end