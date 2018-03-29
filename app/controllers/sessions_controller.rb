class SessionsController < ApplicationController

  def new
    redirect_to user_path(current_user) if current_user
  end

  def create
    user = User.find_by(:name => params[:user][:name]).try(:authenticate, params[:user][:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back to the theme park!"
      redirect_to user_path(user)
    else
      binding.pry
    end

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
  
end
