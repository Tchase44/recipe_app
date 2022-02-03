# frozen_string_literal: true

class Users::RegistrationsController < ApplicationController
  respond_to :json
  before_action :configure_sign_up_params, only: [:create]
  # before_action :authenticate_request!, only: [:index]
  # before_action :configure_account_update_params, only: [:update]


  # POST /sign_up
  def create
    user = User.new(
      email: params[:sign_up][:email].downcase,
      password: params[:sign_up][:password],
      password_confirmation: params[:sign_up][:password_confirmation],
      username: params[:sign_up][:username] ? params[:sign_up][:username] : params[:sign_up][:email]
    )
    if user.valid?
      if user.save
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token, message: "Account Created!"}, status: :ok
      else
        render json: {errors: user.errors.full_messages}
      end
    else
      render json: {errors: user.errors.full_messages}
    end
    # super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    params.require(:sign_up).permit(:password, :password_confirmation, :username, :email)
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
