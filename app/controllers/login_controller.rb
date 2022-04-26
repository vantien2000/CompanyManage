class LoginController < ApplicationController
  layout "login"
  def new
  end

  def postLogin
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect_to "/"
    else
    flash[:error] = "Account Invalid! Please check your email and password"
    redirect_to "/login"
    end
  end

  private
  def login_params
    
  end
end
