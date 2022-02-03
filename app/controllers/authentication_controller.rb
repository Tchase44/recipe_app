# Copy/Paste from "https://www.sitepoint.com/introduction-to-using-jwt-in-rails/"
class AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_by(email: params[:authentication][:email].downcase) || User.find_by(username: params[:authentication][:email].downcase)

    if !user.nil? && user.valid_password?(params[:authentication][:password])
      auth_token = JsonWebToken.encode({user_id: user.id, level: user.role_level})
      render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error_message: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def authentication_params
    params.require(:authentication).permit(:email, :password)
  end
  # not used, can add more to token if needed
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end