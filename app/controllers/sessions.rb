get '/sessions/new' do
	erb :'/sessions/new'
end

post '/sessions' do
	@user = User.find_by(username: params[:username])

	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/jokes'
	else
		@errors = ["That password/username combo don't work."]
		erb :'/sessions/new'
	end
end


delete '/sessions' do
	session[:user_id] = nil
	redirect '/jokes'
end