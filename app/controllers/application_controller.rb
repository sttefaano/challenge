class ApplicationController < ActionController::API
  def normalize_json(data, errors = [])
    { data: data, errors: errors }
  end

  def authenticate_user
    token = request.headers['Authorization']
    token = token.split(' ').last if token
    user_id = decode_token(token)
    render json: normalize_json([], { error: 'Unauthorized' }), status: :unauthorized unless user_id
  end

  def decode_token(token)
    return nil unless token
    begin
      decoded = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      decoded[0]['user_id']
    rescue JWT::DecodeError
      nil
    end
  end
end
