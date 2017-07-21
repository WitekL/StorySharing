class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user(return_point = request.url)
    unless logged_in?
      flash[:danger] = "Please log in to continue."
      redirect_to sessions_new_url
    end
  end


end
