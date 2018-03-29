class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  private
    def current_user
      User.find_by(:id => session[:user_id])
    end

    def check_login
      unless current_user
        flash[:alert] = "You must be signed in to do that!"
        redirect_to root_path
      end
    end

    def admin_only
      unless current_user.admin
        flash[:alert] = "Administrators only!"
        redirect_to attractions_path
      end
    end
end
