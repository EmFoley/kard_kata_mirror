enable :sessions

get '/' do
  redirect "/users/#{session[:id]}" if session[:id]
  @msg = session[:message]
  @action = "/login"
  @btn = "Login!"
  session[:message] = nil
  erb :index
end