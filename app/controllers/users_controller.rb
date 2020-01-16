class UsersController < ApplicationController
    
    def index
        users = User.all 
        render json: users, status: :ok
    end 

    def show
        user = User.find(params[:id])
        render json: user, status: :ok
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: :ok
        else
            render json: user.errors, status: :unprocessable_entity
    end

    def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
            render json: user, status: :ok
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user, status: :ok
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :name)
    end
    
end