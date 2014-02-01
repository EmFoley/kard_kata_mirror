get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/info' do
  Demo.new(self).info
end

get '/decks/:deck_id/:user_id'
  # @current_card = Deck.where(id: session[:deck_id])
  # @current_card.pop
  erb :game
end

# select a deck page -> array of card objects -> session[:cards_array]