class ApplicationController < ActionController::Base
    include LoginHelper
    helper_method :current_user
    helper_method :login_in?
    def current_user
        user.find_by(user_id: [session[:user_id]])
    end
    def login_in?
        !current_user.nil?
    end
    # def logout
    #     session[:user_id].nil
    # end
end
