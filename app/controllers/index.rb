enable :sessions

get '/' do
  @valid_pw = session[:message]
  session[:message] = ''
  erb :index
end

get '/users/new' do
  erb :new_user
end

get '/users/:id' do
  "You're logged"
end

post '/login' do
  user = User.find_by_username(params[:username])
  if params[:password] == user.password
    session[:logged_in] = true
    redirect "/users/#{user.id}"
  else
    session[:message] = "Invalid Password"
    redirect "/"
  end
end

post '/users/new' do
  new_user = User.new(params)
  if new_user.valid?
    new_user.save
    redirect "/users/#{new_user.id}"
  end
end