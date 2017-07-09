class SessionsController < ApplicationController
  def new
  end

#TODO konto administratora z możliwością usuwania wszystkiego
#TODO usuwanie użytkowników, artykułów, zdjęć, komentarzy

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to home_index_url
    else
      flash.now[:danger] = "Invalid email/password"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to home_index_url
  end
end
