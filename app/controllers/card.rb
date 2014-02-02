# delete a specific card
delete '/cards/:id' do
  Card.destroy(params[:id])
  redirect "/decks/#{params[:deck_id]}/edit"
end

# create a new card
post '/cards' do
  Card.create(params)
  redirect "/decks/#{params[:deck_id]}/edit"
end

# edit a specific card
put '/cards/:id' do
  card = Card.find(params[:id])
  card.update_attributes(
    deck_id: params[:deck_id],
    question: params[:question],
    answer: params[:answer])
  redirect "/decks/#{params[:deck_id]}/edit"
end