get '/jokes/:id/votes' do
  @joke = Joke.find(params[:id])

  if logged_in?
    if params[:route] == "new"
      @vote = Vote.find_by(votable_type: "joke", votable_id: params[:id], user_id: current_user.id)
      if @vote == nil
        @vote = Vote.create(votable_type: "joke", votable_id: params[:id], user_id: current_user.id)
        @joke.vote_tally += 1
        @joke.save
        content_type :json
        {tally: @joke.vote_tally }.to_json
      end
    elsif params[:route] == "delete"
      @vote = Vote.find_by(votable_type: "joke", votable_id: params[:id], user_id: current_user.id)
      if @vote != nil
        @vote.destroy
        @joke.vote_tally -= 1
        @joke.save
        content_type :json
        {tally: @joke.vote_tally}.to_json
      end
    end
  else
    content_type :json
    {login: "logged-out", message: "You must be logged in to vote."}.to_json     
  end

end


get '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  @joke = @answer.joke

  if logged_in?
    if params[:route] == "new"
      @vote = Vote.find_by(votable_type: "answer", votable_id: params[:id], user_id: current_user.id)
      if @vote == nil
        @vote = Vote.create(votable_type: "answer", votable_id: params[:id], user_id: current_user.id)
        @answer.vote_tally += 1
        @answer.save
        content_type :json
        {tally: @answer.vote_tally}.to_json
      end
    elsif params[:route] == "delete"
      @vote = Vote.find_by(votable_type: "answer", votable_id: params[:id], user_id: current_user.id)
      if @vote != nil
        @vote.destroy
        @answer.vote_tally -= 1
        @answer.save
        content_type :json
        {tally: @answer.vote_tally}.to_json
      end
    end
  else
    content_type :json
    {login: "logged-out", message: "You must be logged in to vote." }.to_json  
  end

end
