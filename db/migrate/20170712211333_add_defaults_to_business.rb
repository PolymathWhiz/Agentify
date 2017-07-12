class AddDefaultsToBusiness < ActiveRecord::Migration[5.0]
  def up
  	change_column :businesses, :activated, :boolean, default: false
  	change_column :businesses, :admin, :boolean, default: false
  	change_column :businesses, :about, :text, default: "", null: false
	end

	def down
  	change_column :businesses, :activated, :boolean, default: nil
  	change_column :businesses, :admin, :boolean, default: nil
  	change_column :businesses, :about, :text, default: nil
	end
end
