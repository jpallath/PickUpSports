class SessionsController < ApplicationController
  def new
  end

	# def create
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_url
  # end
  def create
    auth_hash = request.env['omniauth.auth']
    puts(auth_hash)
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    
    session[:user_id] = "Salim"
    if @authorization
      redirect_to "/games/show"
    else
      user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
      user.save
      redirect_to "/users/new"
    end
  end


  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end


end
