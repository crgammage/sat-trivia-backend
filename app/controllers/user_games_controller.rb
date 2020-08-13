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

    def create
        user_game = UserGame.create(user_game_params)
        render json: user_game, except: [:updated_at, :created_at]
    end

    private

    def user_game_params
        params.require(:user_game).permit(:users, :game)
    end

end
