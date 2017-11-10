post '/jokes/:id/answers' do 
	@joke = Joke.find(params[:id])
	@answer = Answer.create(user_id: current_user.id, joke_id: @joke.id, description_text: params[:description_text], vote_tally: 0)
	redirect "/jokes/#{@joke.id}"
end