class HealthController < ApplicationController
  before_action :authenticate_request! # <- protected routes
  rescue_from ActiveRecord::RecordNotFound, :with => :db_check_failed

  def show
    @db_check = Recipe.first
    if @db_check
      render json: {running: true, db_status: true, loggin_in: true}, status: 200
    else
      render json: {running: true, db_status: false, loggin_in: true}, status: 500
    end
  end

  private

  def db_check_failed
    render json: {running: true, db_status: true, db_status_message: "Record Check Failed"}, status: 400
  end
end