class Company < ApplicationRecord
    self.table_name = "companies"

    self.primary_key = "code"

end
