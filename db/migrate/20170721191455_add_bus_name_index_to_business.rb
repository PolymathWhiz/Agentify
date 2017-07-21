class AddBusNameIndexToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_index :businesses, :business_name
    add_column :businesses, :country, :string, default: "Nigeria"
  end
end
