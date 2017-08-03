class AddBusinessRegistrationNumberToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :registration_number, :text
  end
end
