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
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    session[:user_id] = auth_hash[:uid]
    if @authorization
      redirect_to "/games/show"
    else
      user = User.new :name => auth_hash["info"]["name"], :uid => auth_hash[:uid]
      user.save
      redirect_to "/games"
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to "/games/new"
  end


end
