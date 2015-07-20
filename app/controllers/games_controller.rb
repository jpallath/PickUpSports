class GamesController < ApplicationController
	def new
    # Use the authenticate method called authenticate! which was defined in the app controller to authenticate. Straight foward right?
    authenticate!
  end
	
	def show 
	end
	
	def index
	end
	
	def edit
    authenticate!
	end
	
	def create
    msg = "created!"
    
    #here we grab the ID of the game we created and redirect them there. I haven't created anything in the DB yet 
    #so it's hard to redirect properly. Right now it just goes to the generic show page. it should be game/:id 
    #not game but that's for tomorrow morning. /games/:id(.:format) instead of /game
    redirect_to "/games"
	end
	
	def update
	end
	
	def destroy
	end
	
	
end
