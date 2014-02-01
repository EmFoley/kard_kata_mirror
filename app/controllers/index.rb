enable :sessions

get '/' do
  @valid_pw = session[:message]
  session[:message] = ''
  erb :index
end

get '/users/new' do
  erb :new_user
end

get '/users/:id' do
  session[:game_started] = nil
  if session[:logged_in]
    @decks = Deck.where(user_id: params[:id])
    erb :logged_in_user
  else
    session[:message] = "You can't do that, you're not logged in!"
    redirect '/'
  end
end

post '/login' do
  user = User.find_by_username(params[:username])
  if params[:password] == user.password
    session[:logged_in] = true
    redirect "/users/#{user.id}"
  else
    session[:message] = "Invalid Password"
    redirect "/"
  end
end

post '/logout' do
  session[:logged_in] = false
  redirect '/'
end


# select a deck page -> array of card objects -> session[:cards_array]
post '/users/new' do
  new_user = User.new(params)
  if new_user.valid?
    new_user.save
    session[:logged_in] = true
    redirect "/users/#{new_user.id}"
  end
end

get '/round' do
  p session

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
    session[:answer_message] = "Congratulations! That is correct."
    session[:card_ids].shift
  else
    session[:answer_message] = "Sorry, that was not correct :("
    session[:card_ids].rotate!
  end
  redirect '/round'
end

get '/results' do
  erb :results
end







