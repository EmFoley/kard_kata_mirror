enable :sessions

get '/' do
  @msg = session[:message]
  @action = "/login"
  @btn = "Login!"
  session[:message] = nil

  if session[:id] != nil
    redirect "/users/#{session[:id]}"
  else
    erb :index
  end
end

