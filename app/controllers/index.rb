enable :sessions

before do
  @logged_in = session[:id] ? true : false
end

get '/' do
  @valid_pw = session[:message]
  @action = "/login"
  @btn = "Login!"
  session[:message] = nil
  erb :index
end

get '/users/new' do
  @action = "/users/new"
  @btn = "Create User"
  erb :new_user
end

get '/users/:id' do
  if @logged_in
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
    session[:id] = user.id
    redirect "/users/#{user.id}"
  else
    session[:message] = "Invalid Password"
    redirect "/"
  end
end

post '/logout' do
  session[:id] = nil
  redirect '/'
end

post '/users/new' do
  new_user = User.new(params)
  if new_user.valid?
    new_user.save
    session[:id] = new_user.id
    redirect "/users/#{new_user.id}"
  end
end