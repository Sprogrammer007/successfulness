class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  # protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }


  def authenticate_user
    if current_user
      render json: current_user
    else 
      render json: {}, status: 100 
    end
    
  end
end
