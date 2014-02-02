# Display a list of all Decks
get '/decks' do
  @decks = Deck.where(user_id: session[:id])
  erb :list_decks
end

# Create a new Deck
post '/decks' do
  Deck.create(name: params[:name], user_id: session[:id])
  redirect '/decks'
end

# Display contents of a specific Deck
get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @cards = Card.where(deck_id: @deck.id)
  erb :view_deck
end

# Edit contents of a specific Deck
get '/decks/:id/edit' do
  @deck = Deck.find(params[:id])
  @cards = Card.where(deck_id: @deck.id)
  erb :edit_deck
end

# delete a specific deck
delete '/decks/:id' do
  Deck.destroy(params[:id])
  redirect '/decks'
end

# update a specific deck
put '/decks/:id' do
  deck = Deck.find(params[:id])
  deck.update_attributes(name: params[:name])
  redirect "/decks/#{params[:id]}/edit"
end


