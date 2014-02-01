get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/info' do
  Demo.new(self).info
end

get '/decks/:deck_id' do
  @message = session[:answer_message]
  @card = Card.where(deck_id: params[:deck_id]).sample
  erb :game
  session[:answer_message] = ""
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