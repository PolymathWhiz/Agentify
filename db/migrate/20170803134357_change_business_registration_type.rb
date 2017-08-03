class ChangeBusinessRegistrationType < ActiveRecord::Migration[5.0]
  def up
    change_column :businesses, :registration_number, :string
  end

  def down
    change_column :businesses, :registration_number, :text
  end
end