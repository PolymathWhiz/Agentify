class AddAdminToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :admin, :boolean, default: false
    add_index :admins, :admin
  end
end
