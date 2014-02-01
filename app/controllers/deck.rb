get '/decks' do
  @decks = Deck.where(user_id: session[:user_id])
  erb :decks
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @cards = Card.where(deck_id: @deck.id)
  erb :view_deck
end

get '/decks/:id/edit' do
  @deck = Deck.find(params[:id])
  @cards = Card.where(deck_id: @deck.id)
  erb :edit_deck
end