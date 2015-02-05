class ApplicationController < ActionController::Base

  def current_user
    warden.user
  end

  helper_method :current_user
  private

    def resource 
      params[:type].constantize
    end

    def resource_name
      params[:type].downcase.to_sym
    end
    
    def warden
      env['warden']
    end


end
