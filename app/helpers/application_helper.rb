module ApplicationHelper

  def signed_in?
    session[:user_id] ? true : false
  end

  def current_user
    User.find_by(:id => session[:user_id])
  end
end
