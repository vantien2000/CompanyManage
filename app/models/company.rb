class Company < ApplicationRecord
    VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
    self.table_name = "companies"

    self.primary_key = "code"

    validates :code, presence: { message: "%{value} is required" }, length: {maximum: 256}, format: {with: /\A([A-Za-z]|[0-9]){6}\z/i, message: 'Please enter a valid %{value}'}
    validates :company_name, presence: { message: "%{value} is required" }, length: {maximum: 256, message: "%{value} be at least 256 characters long"}
    validates :address, presence: { message: "%{value} is required" }, length: {maximum: 256, message: "%{value} be at least 256 characters long"}
    validates :email, presence: { message: "%{value} is required" }, length: {maximum: 256, message: "%{value} be at least 256 characters long"}, format: { with: VALID_EMAIL_REGEX, message: 'Please enter a valid %{value}', multiline: true}
    validates :phone_number, presence: { message: "%{value} is required" }, format: {with: /(84|0[3|5|7|8|9])+([0-9]{9})\b/i, message: 'Please enter a valid %{value}'}
    validates :website, length: {maximum: 256, message: "%{value} be at least 256 characters long"}
    validates :logo, presence: { message: "%{value} is required" } , format: { with: /.*\.(gif|jpeg|bmp|webp|svg|jpg|png)\z/i , message: 'Please enter a valid %{value}'}
end
