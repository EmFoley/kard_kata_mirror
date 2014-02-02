enable :sessions

get '/' do
  @msg = session[:message]
  @action = "/login"
  @btn = "Login!"
  session[:message] = nil
  erb :index
end