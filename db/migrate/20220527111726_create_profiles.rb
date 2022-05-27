class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.interger :profile_id
      t.string :company_name

      t.timestamps
    end
  end
end
