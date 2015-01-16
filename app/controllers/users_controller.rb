class UsersController < ApplicationController
  
  before_filter :authenticate_all!

  def show
    @user = current_user || current_admin || User.find_by(username: params[:id])
    render layout: "app_ember"
  end

  private

    def authenticate_all!
      if current_admin
        authenticate_admin!
      elsif current_user
        authenticate_user!
      end
    end
end
