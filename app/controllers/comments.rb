post '/jokes/:id/comments' do
	if logged_in?
		@comment = Comment.create(description_text: params[:description_text], commentable_type: "Joke", user: current_user, commentable_id: params[:id])
		redirect "/jokes/#{params[:id]}"
	else
		@errors = ["You must be logged in to post a comment."]
		erb :'/sessions/new'
	end
end

post '/answers/:id/comments' do
	@answer = Answer.find(params[:id])
	@joke = @answer.joke
	if logged_in?
		@comment = Comment.create(description_text: params[:description_text], commentable_type: "Answer", user: current_user, commentable_id: params[:id])
		redirect "/jokes/#{@joke.id}"
	else
		@errors = ["You must be logged in to post a comment."]
		erb :'/sessions/new'
	end
end