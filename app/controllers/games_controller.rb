class GamesController < ApplicationController
    wrap_parameters :game, include: [:users, :questions]
    
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

    def create
        game = Game.new(game_params)
        questions = params["questions"]
        users = params["users"]
        questions.each do |question|
            gameQuestion = Question.find(question["id"])
            game.questions << gameQuestion
            game.save
        end
        users.each do |user|
            gameUser = User.find(user["id"])
            game.users << gameUser
            game.save
        end
        render json: game, include: [:questions, :users], status: :created
    end


    private

    def game_params
        params.require(:game).permit(:user, questions: [])
    end

end
