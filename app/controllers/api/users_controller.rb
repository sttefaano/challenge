class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token(user_id: @user.id)
      render json: normalize_json({ message: "Account created succesfully.", bearer_token: token }, @user.errors), status: :created
    else
      render json: normalize_json({ message: "There was an error creating your account." }, @user.errors), status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
