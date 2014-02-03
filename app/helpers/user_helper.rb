helpers do
  def check_password(user)
    begin
      if user.password == params[:password]
        session[:id] = user.id
        redirect "/users/#{user.id}"
      end
    rescue
      session[:message] = "Invalid Username or Password"
      redirect '/'
    end
  end

  def approve_new_user(new_user)
    if new_user.valid?
      new_user.save
      session[:id] = new_user.id
      return true
    else
      session[:message] = "That username or password is invalid."
      return false
    end
  end
end
