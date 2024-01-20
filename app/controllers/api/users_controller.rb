module Api
  class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      if @user.save
        render json: normalize_json("Account created succesfully.", @user.errors), status: :created
      else
        render json: normalize_json("There was an error creating your account.", @user.errors), status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end
end
