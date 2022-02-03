# Devise is messing with my API routes so im creating smaller custom controllers and routes
class Users::UsernameController < ApplicationController
  respond_to :json
  before_action :authenticate_request! # <- protected routes

  def show
    u = @current_user
    puts "#{}"
    render json: {username: u.username, level: u.role_level}
  end

  def update
    u = User.find(usename_params["id"])
    if u.id == current_user.id && u.username == current_user.username
      u.username = usename_params["username"]
      if u.save
        render json: { username: u.username, message: "Change Successful"}
      else
        render json: {errors: user.errors.full_messages}
      end
    else
      render json: {errors: "Unautorized"}
    end
  end

  def available
    x = User.find_by(username: usename_params[:username]).select(:username)
    render json: {username: "Finding available usernames"}
  end

  private

  def usename_params
    params.require(:account_update).permit(:id, :username)
  end
end