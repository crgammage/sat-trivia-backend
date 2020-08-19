class GamesController < ApplicationController
    wrap_parameters :game, include: [:users, :questions]
    
    def index
        games = Game.all
        render json: games, include: [:user1s, :user2s, :questions], except: [:updated_at, :created_at]
    end

    def show
        game = Game.find(params[:id])
        render json: game, include: [:user1s, :user2s, :questions]
    end

    def create
        game = Game.new
        questions = params["game"]["questions"]
        user1 = User.find(params["game"]["user1s"]["id"])
        user2 = User.find(params["game"]["user2s"]["id"])
        game.user1s.push(user1)
        game.user2s.push(user2)
        questions.each do |question|
            gameQuestion = Question.find(question["id"])
            game.questions << gameQuestion
            game.save
        end
        
        render json: game, include: [:user1s, :user2s, :questions], status: :created
    end

    def update
        game = Game.find(params[:id])
        game.player_1_turn = !game.player_1_turn
        game.completedQuestions = game.completedQuestions + 1
        if game.completedQuestions >= 20 
            game.finished = true
        end
        game.save
        render json: game, include: [:user1s, :user2s, :questions]
    end


    private

    def game_params
        params.require(:game).permit(:completedQuestions, :player_1_turn, :finished, users: [:id, :name, :username, :password_digest, :level, :score], questions: [:questions => [:id, :prompt, :a, :b, :c, :d, :answer, :points]]).permitted?
    end

end
