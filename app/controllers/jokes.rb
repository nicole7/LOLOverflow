get '/jokes' do
  	@jokes = Joke.all.order(created_at: :desc)
  	erb :'jokes/index'
end

get '/jokes/new' do
  erb :'jokes/new'
end

post '/jokes' do
  @joke = Joke.new(joke: params[:joke], punchline: params[:punchline], vote_tally: 0, user_id: current_user.id, view_count: 0 )
  if @joke.save
    redirect "/jokes/#{@joke.id}"
  else
    @errors = @joke.errors.full_messages
  end
end

get '/jokes/:id' do
  @joke = Joke.find_by_id(params[:id])
  @joke.view_count += 1
  @joke.save

  erb :"jokes/show"
end


