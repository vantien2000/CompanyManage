class LoginController < ApplicationController
  layout "login"
  def index
    if login_in?
      redirect_to "/"
    end
  end

  def postLogin
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      rolesLogin session[:user_id]
    else
      flash[:error] = "Account Invalid! Please check your email and password"
      redirect_to "/login"
    end
  end

  def rolesLogin user_id
    user_role = UserRole.select('role_id').where('user_id', session[:user_id]).all()
    case user_role[0]
    when 1
      redirect_to "/"
    when 2
      render html: "AAA"
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
