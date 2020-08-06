class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, include: [:games, :questions], except: [:updated_at, :created_at]
    end

    def show
        user = User.find(params[:id])
        options = {
            include: :games
        }
        render json: UserSerializer.new(user, options)
    end

end
