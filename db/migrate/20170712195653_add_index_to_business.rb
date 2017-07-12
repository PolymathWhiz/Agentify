class AddIndexToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :agency_type, :string
    add_index :businesses, :admin
    add_index :businesses, :city
    add_index :businesses, :state
    add_index :businesses, :activated
  end
end
