class Company < ApplicationRecord
    mount_uploader :logo, ImageUploader
    serialize :logo, String
    VALID_CODE_REGEX= /(\w+[0-9]+)|([0-9]+\w+)/i
    VALID_EMAIL_REGEX= /\A[\w+\-.]{2,}@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_PHONE_REGEX= /(84|0[3|5|7|8|9])+([0-9]{8,9})\b/i
    VALID_IMAGE_REGEX= /.*\.(gif|jpeg|bmp|webp|svg|jpg|png)\z/iu

    self.table_name = "companies"
    self.primary_key = "code"
    has_many :profiles

    validates :code, presence: { message: "Code is required" }, length: { is: 6, message: "Company code must have 6 characters!" }, format: { with: VALID_CODE_REGEX, message: 'Please enter a valid code' }
    validates :company_name, presence: { message: "Company name is required" }, length: {maximum: 256, message: "Company name be at least 256 characters long"}
    validates :address, presence: { message: "Address is required" }, length: {maximum: 256, message: "Address be at least 256 characters long"}
    validates :email, presence: { message: "Email is required" }, length: {maximum: 256, message: "Email be at least 256 characters long"}, format: { with: VALID_EMAIL_REGEX, message: 'Please enter a valid email'}
    validates :phone_number, presence: { message: "Phone number is required" }, format: {with: VALID_PHONE_REGEX, message: 'Please enter a valid phone number'}
    validates :website, length: {maximum: 256, message: "Website be at least 256 characters long"}
    validates :logo, presence: { message: "Logo is required" }
    # validates_size_of :logo, maximum: 1.megabytes, message: "Logo souble be less than 1MB"
end