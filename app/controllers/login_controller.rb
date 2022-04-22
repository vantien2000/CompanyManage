class LoginController < ApplicationController
  layout "login"

  def index
  end

  def postLogin
    render html: 'hehe'
    # render json: User.validators ;
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.user_id
    #   redirect_to '/'
    # else
    #   flash[:error] = "Account Invalid! Please check your email and password"
    #   redirect_to action: index
    # end
  end

  def login_params
    params.permit(:email, :password_digest)
  end
end
