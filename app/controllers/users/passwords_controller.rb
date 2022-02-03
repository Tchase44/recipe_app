# frozen_string_literal: true
# todo: see if devise interferes with these routes as well
class Users::PasswordsController < ApplicationController
  respond_to :json
  before_action :authenticate_request! # <- protected routes

  # PUT /resource/password
  def update
    # super
    user = User.find(password_params[:id])
    # double check the user
    if user.id == @current_user.id && user.username == @current_user.username
      # update the passwords
      if user.update_with_password(password_params)
        render json: {message: "Update Successful!"}
      else
        render json: {error: user.errors.full_messages}
      end
    else
      render json: {error: "Unauthorized"}, status: 401
    end
  end

  private

  def password_params
    params.require(:account_update).permit(:id, :current_password, :password, :password_confirmation, :default)
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
