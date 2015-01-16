class UsersController < ApplicationController
  layout "app_ember"
  before_filter :authenticate_all!

  def show
    @user = find_current_user(params[:id])
  end

  def settings
    @user = find_current_user(params[:id])
  end

  def update_settings
    Rails.logger.warn "#{params[:user]}"
    # @user = find_current_user(params[:id])
    # @user.update(profile: params[:profile])
    redirect_to :back
  end

  private

    def find_current_user(id)
      current_user || current_admin || User.find_by(username: id)  
    end

    def authenticate_all!
      if current_admin
        authenticate_admin!
      elsif current_user
        authenticate_user!
      end
    end
end
