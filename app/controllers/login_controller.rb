class LoginController < ApplicationController
  layout "login"
  def new
  end

  def postLogin
    result_params = validate_login params
    render json: result_params
    # validateLogin = User.new({'email': params[:email], 'password_digest': params[:password]})
    # if validateLogin.invalid?
    #   flash[:email] = validateLogin.errors[:email] ? validateLogin.errors[:email] : ''
    #   flash[:password] = validateLogin.errors[:password] ? validateLogin.errors[:password] : ''
    #   render "new"
    # else
    #   user = User.find_by_email(params[:email])
    #   if user && user.authenticate(params[:password])
    #     session[:user_id] = user.user_id
    #     redirect_to '/'
    #   end
    #   render json: "aaa"
    #   # flash[:error] = "Account Invalid! Please check your email and password"
    # end
  end

  private
  def login_params
    
  end
end
