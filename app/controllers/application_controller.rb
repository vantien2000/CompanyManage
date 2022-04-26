class ApplicationController < ActionController::Base
    include LoginHelper
    helper_method :current_user
    helper_method :login_in?
    def current_user
        User.find_by(user_id: [session[:user_id]])
    end
    def login_in?
        !current_user.nil?
    end
end
