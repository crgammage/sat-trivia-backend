class UserGamesController < ApplicationController

    def index
        user_games = UserGame.all
        render json: user_games, except: [:updated_at, :created_at]
    end

    def show
        user_game = UserGame.find(params[:id])
        options = {
            include: [:game, :user], except: [:updated_at, :created_at]
        }
        render json: UserGameSerializer.new(user_game, options) 
    end

end
