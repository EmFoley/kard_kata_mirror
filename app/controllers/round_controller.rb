get '/round' do
  # if !session[:game_started] should be sufficient
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
  # Could the card know this text stuff?  It seems odd that it's defined in the
  # controller.  What if you had:
  #
  # return_text = current_card.evaulate_answer(params[:user_answer])
  # evaluate_answer could set @outcome
  #
  # Then:
  # guess = Guess.create!(round_id: session[:round_id], outcome: current_card.outcome, card_id: current_card.id)
  #
  # WHY:
  #
  # A card now singularly can store this "Congrats.." or "Sorry" message
  # It also knows how to track its own outcome state (not a controller
  # responsiblity)
  #
  # Plus consider:
  #
  # Guess.create_for_card_in_round(round_id: session[:round_id], current_card)
  #
  # Wow such OO!
  #
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
