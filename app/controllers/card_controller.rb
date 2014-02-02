# delete a specific card
delete '/users/:id/decks/:deck_id/cards/:card_id' do
  Card.destroy(params[:card_id])
  redirect "/users/#{session[:id]}/decks/#{params[:deck_id]}/edit"
end

# create a new card
post '/users/:id/decks/:deck_id/cards' do
  Card.create(
    question: params[:question],
    answer: params[:answer],
    deck_id: params[:deck_id])
  redirect "users/#{session[:id]}/decks/#{params[:deck_id]}/edit"
end

# edit a specific card
put '/users/:id/decks/:deck_id/cards/:card_id' do
  card = Card.find(params[:card_id])
  card.update_attributes(
    deck_id: params[:deck_id],
    question: params[:question],
    answer: params[:answer])
  redirect "users/#{session[:id]}/decks/#{params[:deck_id]}/edit"
end