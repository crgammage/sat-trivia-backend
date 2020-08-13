class UsersController < ApplicationController
wrap_parameters :user, include: [:name, :username, :password, :score, :level, :password_confirmation, :games]

    def index
        users = User.all
        render json: users, include: [:games], except: [:updated_at, :created_at]
    end

    def show
        user = User.find(params[:id])
        render json: user, include: [:games]
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        user.save
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :score, :level)
    end

end
