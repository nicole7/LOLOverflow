get '/jokes/:id/votes' do 
	@joke = Joke.find(params[:id])

	if logged_in?	
		if params[:route] == "new"
			@vote = Vote.find_by(votable_type: "joke", votable_id: params[:id], user_id: current_user.id)
			if @vote
				redirect "/jokes/#{@joke.id}"			
			else
				@vote = Vote.create(votable_type: "joke", votable_id: params[:id], user_id: current_user.id)
				@joke.vote_tally += 1
				@joke.save
				redirect "/jokes/#{@joke.id}"			
			end				
		elsif params[:route] == "delete"
			@vote = Vote.find_by(votable_type: "joke", votable_id: params[:id], user_id: current_user.id)
			if @vote
				@vote.destroy
				@joke.vote_tally -= 1
				@joke.save
			end
			redirect "/jokes/#{@joke.id}"
		end
	else
		@errors = ["You must be logged in."]
		erb :'/sessions/new'
	end

end	


get '/answers/:id/votes' do 
	@answer = Answer.find(params[:id])
	@joke = @answer.joke

	if logged_in?	
		if params[:route] == "new"
			@vote = Vote.find_by(votable_type: "answer", votable_id: params[:id], user_id: current_user.id)
			if @vote
				redirect "/jokes/#{@joke.id}"			
			else
				@vote = Vote.create(votable_type: "answer", votable_id: params[:id], user_id: current_user.id)
				@answer.vote_tally += 1
				@answer.save
				redirect "/jokes/#{@joke.id}"			
			end				
		elsif params[:route] == "delete"
			@vote = Vote.find_by(votable_type: "answer", votable_id: params[:id], user_id: current_user.id)
			if @vote
				@vote.destroy
				@answer.vote_tally -= 1
				@answer.save
			end
			redirect "/jokes/#{@joke.id}"
		end
	else
		@errors = ["You must be logged in."]
		erb :'/sessions/new'
	end

end	

