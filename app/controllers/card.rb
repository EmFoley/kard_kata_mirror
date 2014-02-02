# delete a specific card
delete '/cards/:id' do
  Card.destroy(params[:id])
  redirect "/decks/#{params[:deck_id]}/edit"
end