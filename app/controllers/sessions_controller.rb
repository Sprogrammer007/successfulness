class SessionsController < ApplicationController

  def new
    flash.now[:alert] = warden.message if warden.message.present?  
  end

  def create
    warden.authenticate!(scope: :user)
    redirect_to dashboard_user_path(current_user), notice: "Logged in!"
  end

  def destroy
    warden.logout
    redirect_to root_url, notice: "Logged out!"
  end

  protected

    def i18n_scope
      'sessions'
    end
end