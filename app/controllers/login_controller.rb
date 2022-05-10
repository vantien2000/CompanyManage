class LoginController < ApplicationController
  layout "login"

  @@superAdmin = 1
  @@company = 2
  @@user = 3

  def index

  end

  def postLogin
    session[:old_email] = params[:email]
    session[:old_password] = params[:params]
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      role = UserRole.where(user_id: user.user_id).first()
      if role[:user_id] == @@superAdmin
        session[:user_id] = user.user_id
        redirect_to "/companies"
      end
      if role[:user_id] == @@company
        render html: 'đây là company account'
      end
      if role[:user_id] == @@user
        render html: 'đây là user account'
      end
    else
      flash[:error] = "Account Invalid! Please check your email and password"
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    redirect_to "/login"
  end

  private
  def login_params
    
  end
end
