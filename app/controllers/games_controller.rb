class GamesController < ApplicationController
    def new
    # Use the authenticate method called authenticate! which was defined in the app controller to authenticate. Straight foward right?
        authenticate!
    end



    def index
    end

    def edit
    authenticate!
    end

    def create
        authenticate!
       thing = Game.new(name:params[:game][:name],type_of:params[:game][:type_of],location:params[:game][:location], gamedate:params[:game][:date], gametime:params[:game][:time], max_players:params[:game][:max_players])
       thing.save
			 puts(thing)
       redirect_to "/games"
     end


    #here we grab the ID of the game we created and redirect them there. I haven't created anything in the DB yet
    #so it's hard to redirect properly. Right now it just goes to the generic show page. it should be game/:id
    #not game but that's for tomorrow morning. /games/:id(.:format) instead of /game

    def update
    end

    def destroy
    end

    def show
    end

end
