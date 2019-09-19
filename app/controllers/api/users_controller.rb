class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            render 'api/users/show'
        else
            render json: ['Please fill out empty fields'], status: 422
        end
    end

    def update
        @user = current_user
        if @user.update_attributes(user_params)
            render 'api/users/show'
        else
            render json: ['Please fill out empty fields'], status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
