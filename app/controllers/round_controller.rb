get '/round' do
  if session[:game_started] == false
    initialize_round
    session[:game_started] = true
  end
  redirect '/round/score' if session[:card_ids].empty?
  @current_card = Card.find(session[:card_ids].first)
  erb :round
end

get '/round/result' do
  @message = session[:answer_message]
  erb :guess_result
end

get '/round/score' do
  @user_score = Round.find(session[:round_id]).score
  erb :user_score
end

post '/round' do
  current_card = Card.find(session[:card_ids].shift)
  if current_card.answer == params[:user_answer]
    outcome = 1
    session[:answer_message] = "Congratulations! That is correct."
  else
    outcome = 0
    session[:answer_message] = "Sorry, that was not correct :( \n The correct answer is: #{current_card.answer}."
  end

  guess = Guess.create!(round_id: session[:round_id], outcome: outcome, card_id: current_card.id)
  redirect '/round/result'
end
