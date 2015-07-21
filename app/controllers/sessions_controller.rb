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

    @authorization = Authorization.find_by(
      provider: auth_hash["provider"],
      uid: auth_hash["uid"]
    )

    session[:user_id] = auth_hash[:uid]

    if @authorization
        redirect_to "/games"
    else
      @user = User.find_or_initialize_by(uid: auth_hash[:uid])
      @user.name = auth_hash["info"]["name"]
      @user.save

      redirect_to games_url
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to "/games"
  end


end
