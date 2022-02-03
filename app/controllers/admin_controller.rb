class AdminController < ApplicationController
  before_action :authenticate_request!
  before_action :role_gaurd
  rescue_from ActiveRecord::RecordNotFound, :with => :user_not_found

  def index
    @users = User.all
    render "/layouts/admin/index.json.jbuilder"
  end

  # def show
  #   @user = User.find(params[:id])
  #   render "/layouts/admin/show.json.jbuilder"
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.validate && @current_user.role_level == 3
  #     @user.save
  #     render "/layouts/admin/show.json.jbuilder", status: :created
  #   else
  #     render "/layouts/admin/show.json.jbuilder", status: 400
  #   end
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     render "/layouts/admin/show.json.jbuilder", status: 201
  #   else
  #     render json: { message: "Failed to Update", error: @user.errors }, status: 400
  #   end
  # end

  def destroy
    @user = User.find(params[:id])
    if @current_user.role_level == 3
      if @user.destroy
        render json: { message: "Success" },status: 204
      else
        render json: { message: "Faild to Delete", error: @user.errors }, status: 400
      end
    else
      render json: { message: Unauthorized, error: @user.error}, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :id)
  end

  def user_not_found
    render json: {message: "Not Found", status: 400}
  end
end
