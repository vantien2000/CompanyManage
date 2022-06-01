class UserRole < ApplicationRecord
    self.table_name = "role_user"

    self.primary_key = "role_id"
end
  