class User < ApplicationRecord
    has_secure_password

    self.table_name = "users"

    self.primary_key = "user_id"

    validates :email, presence: true, length: {maximum: 255}

    validates :password, presence: true, length: {maximum: 255}
end
  