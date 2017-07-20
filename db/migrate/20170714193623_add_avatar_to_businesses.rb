class AddAvatarToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :avatar, :string
  end
end
