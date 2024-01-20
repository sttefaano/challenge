class Api::AuthController < ApplicationController
  require 'jwt'

  def authenticate
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = encode_token(user_id: user.id)
    render json: normalize_json({ bearer_token: token })
    else
      render json: normalize_json({ message: "Error when trying authenticate." }, { error: 'Invalid username or password' }), status: :unauthorized
    end
  end
end
