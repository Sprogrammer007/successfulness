class TeachersController < ApplicationController
  
  before_filter :authenticate_user!

  def show
    @user = current_user || User.find_by(username: params[:id])
    render layout: "app_ember"
  end
end
