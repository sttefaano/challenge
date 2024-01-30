class Api::AuthController < ApplicationController

  def authenticate
    user = User.find_by(username: auth_params[:username])
    if user && user.authenticate(auth_params[:password])
      token = encode_token(user_id: user.id)
      render json: normalize_json({ bearer_token: token })
    else
      render json: normalize_json({ message: "Error when trying authenticate." }, { error: 'Invalid username or password' }), status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end
