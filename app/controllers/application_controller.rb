require 'date'
class ApplicationController < ActionController::Base
    layout "application"
    helper_method :current_user
    helper_method :login_in?
    before_action :update_company

    def current_user
        User.find_by(user_id: [session[:user_id]])
    end
    def login_in?
        !current_user.nil?
    end

    def update_company
        today = Date.today.to_time.strftime("%Y-%m-%d")
        @profileUpdate =  Profile.getProfileByDate(today)
        for profile in @profileUpdate do
            company = Company.find_by_code(profile.code)
            company.update_columns company_name: profile.company_name,
            address: profile.address,
            email: profile.email,
            phone_number: profile.phone_number,
            logo: profile.logo_identifier,
            website: profile.website,
            status: profile.status
        end
    end
end
