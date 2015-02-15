class UsersController < ApplicationController
  
  layout "app_ember"
  before_filter :authenticate_user!

  def show
   @user = User.find_by_username(params[:id])
  end

  def settings

  end

  def dashboard
  end

  def update_settings
    @user = User.find_by_username(params[:id])
    @user.update(profile: params[:profile])
    redirect_to :back
  end

end
