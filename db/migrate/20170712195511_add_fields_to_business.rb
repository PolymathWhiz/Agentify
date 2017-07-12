class AddFieldsToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :business_name, :string
    add_column :businesses, :phno, :string
    add_column :businesses, :state, :string
    add_column :businesses, :city, :string
    add_column :businesses, :address, :text
    add_column :businesses, :business_website, :string
    add_column :businesses, :requester_name, :string
    add_column :businesses, :requester_email, :string
    add_column :businesses, :admin, :boolean
    add_column :businesses, :activated, :boolean
  end
end
