class UsersController < ApplicationController
  layout "app_ember"


  def show
   @user = User.find_by_username(params[:id])
  end

  def settings

  end

  def update_settings
    @user = User.find_by_username(params[:id])
    @user.update(profile: params[:profile])
    redirect_to :back
  end

end
