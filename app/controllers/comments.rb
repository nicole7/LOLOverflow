post '/jokes/:id/comments' do
	if logged_in?
		@comment = Comment.create(description_text: params[:description_text], commentable_type: "Joke", user: current_user, commentable_id: params[:id])
		redirect "/jokes/#{params[:id]}"
	else
		@errors = ["You must be logged in to post."]
		erb :'/sessions/new'
	end

end