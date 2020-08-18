class UsersController < ApplicationController
wrap_parameters :user, include: [:name, :username, :password, :score, :level, :password_confirmation, :games]
before_action :authorized, only: [:stay_logged_in]

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
            token = encode_token( { user_id: user.id })
            render json: {user: user, token: token}, status: :created
        else
            render json: {error: 'Failed to create user'}, status: :not_acceptable
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            wristband = encode_token({user_id: user.id})
            render json: {user: user, token: wristband}
        else
            render json: {message: "Incorrect username or password"}
        end
    end

    def stay_logged_in
        wristband = encode_token({user_id: @user.id})
        render json: {user: @user, token: wristband}
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
