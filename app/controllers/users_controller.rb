class UsersController < ApplicationController
wrap_parameters :user, include: [:name, :username, :password, :score]

    def index
        users = User.all
        render json: users, except: [:updated_at, :created_at]
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
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
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :score)
    end

end
