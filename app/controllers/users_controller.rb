class UsersController < ApplicationController
  before_action :check_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to new_session_path
    else
      flash[:alert] = "There was a problem with your signup attempt. Please try again."
      render :new
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
    end
end
