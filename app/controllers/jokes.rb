get '/jokes' do
  	@jokes = Joke.all
  	erb :'jokes/index'
end


get '/jokes/:id' do	
	@joke = Joke.find(params[:id])
	erb :'/jokes/show'
end