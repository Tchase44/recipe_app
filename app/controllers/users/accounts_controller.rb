# Devise is messing with my API routes so im creating smaller custom controllers and routes
class Users::AccountsController < ApplicationController
  respond_to :json
  before_action :authenticate_request! # <- protected routes

  # def update
  # end

  # DELETE /users
  def destroy
    u = User.find(@current_user.id)
    if u.destroy
      render json: {message: "Successfuly Deleted"}, status: 201
    else
      render json: {errord: u.errors.full_messages}
    end
  end
end