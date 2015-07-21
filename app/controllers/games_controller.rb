class GamesController < ApplicationController
    before_action :authenticate!, except: [:show, :index]

    def new
    end



    def index
    end

    def edit
    end

    def create
      puts game_params
      puts ("XXXXXXXXXXXXXXXXXXXXxxxxxxxxxxxxxxXXXXXXXXXXX")
      puts session[:user_id]
       @game = Game.new(game_params)
       @game.creator_id = session[:user_id]
       @game.save
       redirect_to "/games"
     end

     private
     def game_params
       params.require(:game)
             .permit(:name, :type_of, :location, :gamedate, :gametime, :max_players,
             :description, :address, :city, :state, :longitude, :latitude)
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
