class Profile < ApplicationRecord
    mount_uploader :logo, ImageUploader
    serialize :logo, String

    VALID_CODE_REGEX= /(\w+[0-9]+)|([0-9]+\w+)/i
    VALID_EMAIL_REGEX= /\A[\w+\-.]{2,}@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_PHONE_REGEX= /(84|0[3|5|7|8|9])+([0-9]{8,9})\b/i
    VALID_IMAGE_REGEX= /.*\.(gif|jpeg|bmp|webp|svg|jpg|png)\z/iu

    self.table_name = "profiles"
    self.primary_key = "profile_id"
    belongs_to :company

    validates :code, presence: { message: "Code is required" }, length: {is: 6, message: "Company code must have 6 characters!"}, format: { with: VALID_CODE_REGEX, message: 'Please enter a valid code' },
    uniqueness: { case_sensitive: false, message: "Company code must be unique!" }
    validates :company_name, presence: { message: "Company name is required" }, length: {maximum: 256, message: "Company name be at least 256 characters long"}
    validates :address, presence: { message: "Address is required" }, length: {maximum: 256, message: "Address be at least 256 characters long"}
    validates :email, presence: { message: "Email is required" }, length: {maximum: 256, message: "Email be at least 256 characters long"}, format: { with: VALID_EMAIL_REGEX, message: 'Please enter a valid email'}
    validates :phone_number, presence: { message: "Phone number is required" }, format: {with: VALID_PHONE_REGEX, message: 'Please enter a valid phone number'}
    validates :website, length: {maximum: 256, message: "Website be at least 256 characters long"}
    validates :logo, presence: { message: "Logo is required" }
    # validates_size_of :logo, maximum: 1.megabytes, message: "Logo souble be less than 1MB"

    scope :getCodeProfiles, -> { group(:code).pluck(:code) }
    scope :getProfileByDate, -> release_date { where(release_date: release_date) }
    scope :getCodeCompany, -> code { where("code LIKE ?", "%" + code + "%") }
    scope :getCompanyName, -> company_name { where("company_name LIKE ?", "%" + company_name + "%") }
    scope :getEmailCompany, -> email { where("email LIKE ?", "%" + email + "%")}
    scope :getPhoneNumber, -> phone_number { where("phone_number LIKE ?", "%" + phone_number + "%") }
    scope :getStatusCompany, -> status { where(status: status) }

    def Profile.codeCompanyProfiles
        @codeCompanyProfiles = Profile.group(:code).pluck(:code)
    end

    def Profile.filter_profile profile_params_filter, page, per_page, company_id
        @profiles = Profile.where(code: company_id)
        if !profile_params_filter.empty?
            if !(profile_params_filter[:code]).empty?
                @profiles = @profiles.getCodeCompany(profile_params_filter[:code])
            end
            if !(profile_params_filter[:company_name]).empty?
                @profiles = @profiles.getCompanyName(profile_params_filter[:company_name])
            end
            if !(profile_params_filter[:email]).empty?
                @profiles = @profiles.getEmailCompany(profile_params_filter[:email])
            end
            if !(profile_params_filter[:phone_number]).empty?
                @profiles = @profiles.getPhoneNumber(profile_params_filter[:phone_number])
            end
            if !(profile_params_filter[:release_date]).empty?
                @profiles = @profiles.getProfileByDate(profile_params_filter[:release_date])
            end
            if !(profile_params_filter[:status]).empty?
                @profiles = @profiles.getStatusCompany(profile_params_filter[:status])
            end
        end
        @profiles = @profiles ?  @profiles.paginate(page: page, per_page: per_page).order('profiles.profile_id DESC') : []
    end
end