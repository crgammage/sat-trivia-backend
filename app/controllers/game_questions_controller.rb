class GameQuestionsController < ApplicationController

    def index
        game_questions = GameQuestion.all
        render json: game_questions, except: [:updated_at, :created_at]
    end

    def show
        game_question = GameQuestion.find(params[:id])
        options = {
            include: [:games, :questions], except: [:updated_at, :created_at]
        }
        render json: GameQuestionSerializer.new(game_question, options) 
    end
end
