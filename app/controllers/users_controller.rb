class UsersController < ApplicationController
  layout "app_ember"


  def show
   
  end

  def settings

  end

  def update_settings
    Rails.logger.warn "#{params[:user]}"
    # @user = find_current_user(params[:id])
    # @user.update(profile: params[:profile])
    redirect_to :back
  end

end
