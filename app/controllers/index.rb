get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users/new' do
  erb :new_user
end

get '/users/:id' do

end

post '/users/new' do
  new_user = User.new(params)
  if new_user.valid?
    new_user.save
    redirect "/users/#{new_user.id}"
  else
    "That username is taken!"
  end


end