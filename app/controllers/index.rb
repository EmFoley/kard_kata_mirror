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

get '/decks/:deck_id' do
  @message = session[:answer_message]
  @card = Card.where(deck_id: params[:deck_id]).sample
  p @card
  erb :game
  # session[:answer_message] = ""
end

post '/cards/:card_id' do
  card = Card.find(params[:card_id])
  if params[:user_answer] == card.answer
    session[:answer_message] = "Congratulations! That is correct"
  else
    session[:answer_message] = "Sorry, that was not correct :("
  end
  redirect "/decks/#{card.deck_id}"
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
