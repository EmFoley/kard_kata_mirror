# Display a list of all Decks
get '/users/:id/decks' do
  @decks = Deck.where(user_id: session[:id])
  erb :list_decks
end

# Create a new Deck
post '/users/:id/decks' do
  Deck.create(name: params[:name], user_id: session[:id])
  redirect "/users/#{session[:id]}/decks"
end

# Display contents of a specific Deck
get '/users/:id/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: @deck.id)
  erb :view_deck
end

# Edit contents of a specific Deck
get '/users/:id/decks/:deck_id/edit' do
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: @deck.id)
  erb :edit_deck
end

# delete a specific deck
delete '/users/:id/decks/:deck_id' do
  Deck.destroy(params[:deck_id])
  redirect "users/#{session[:id]}/decks"
end

# update a specific deck
put '/users/:id/decks/:deck_id' do
  deck = Deck.find(params[:deck_id])
  deck.update_attributes(name: params[:name])
  redirect "/users/#{session[:id]}/decks/#{params[:id]}/edit"
end


