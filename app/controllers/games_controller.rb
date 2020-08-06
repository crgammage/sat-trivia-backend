class GamesController < ApplicationController
    
    def index
        games = Game.all
        render json: games, include: [:users, :questions], except: [:updated_at, :created_at]
    end

    def show
        game = Game.find(params[:id])
        options = {
            include: [:users, :questions]
        }
        render json: GameSerializer.new(game, options)
    end

end
