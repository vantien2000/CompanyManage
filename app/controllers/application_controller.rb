class ApplicationController < ActionController::Base
    layout "application"
    helper_method :current_user
    helper_method :login_in?
    def current_user
        User.find_by(user_id: [session[:user_id]])
    end
    def login_in?
        !current_user.nil?
    end
end
