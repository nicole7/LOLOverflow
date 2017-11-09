get '/jokes' do
  @jokes = Joke.all
  erb :'jokes/index'
end
