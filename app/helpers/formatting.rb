helpers do
  def em(text)
    "<em>#{text}</em>"
  end

  def logged_in?
    session[:logged_in]
  end
end
