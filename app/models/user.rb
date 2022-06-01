class User < ApplicationRecord
    has_secure_password

    self.table_name = "users"

    self.primary_key = "user_id"
     
    validates :email, presence: { message: "email is required" }, length: {maximum: 255}, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Please enter a valid email address'}

    validates :password, presence: { message: "password is required" }, length: {maximum: 255}
end
  