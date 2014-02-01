before do
  @logged_in = session[:id] ? true : false
end

get '/users/new' do
  @msg = session[:message]
  @action = "/users/new"
  @btn = "Create User"
  erb :new_user
end

get '/users/:id' do
  if session[:id] == params[:id].to_i
    @decks = Deck.where(user_id: session[:id])
    erb :logged_in_user
  else
    session[:message] = "You can't do that, you're not logged in!"
    redirect '/'
  end
end

post '/login' do
  user = User.find_by_username(params[:username])
  check_password(user)
end

post '/logout' do
  session[:id] = nil
  redirect '/'
end

post '/users/new' do
  new_user = User.new(params)
  if approve_new_user(new_user)
    redirect "/users/#{new_user.id}"
  else
    redirect 'users/new'
  end
end

post '/users/decks' do
  puts params
end