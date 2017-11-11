get '/jokes/:id/answers' do
  @joke = Joke.find(params[:id])
  if request.xhr?
    erb :'users/_user_jokes_answers', locals: {joke: @joke}, :layout => false
  else
    redirect "/jokes/#{@joke.id}"
  end
end

post '/jokes/:id/answers' do
  @joke = Joke.find(params[:id])
  if logged_in?
    @answer = Answer.create(user_id: current_user.id, joke_id: @joke.id, description_text: params[:description_text], vote_tally: 0)
    if request.xhr?
      erb :'/jokes/_joke_show_answer', layout: false, locals: { joke: @joke, answer: @answer }
    else
      redirect "/jokes/#{@joke.id}"
    end
  else
    p "hello"
    content_type :json
    {login: "logged-out", message: "You must be logged in to post an answer."}.to_json  
  end
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @joke = @answer.joke
  @joke.best_answer_id = @answer.id
  @joke.save
  redirect "/jokes/#{@joke.id}"
end
