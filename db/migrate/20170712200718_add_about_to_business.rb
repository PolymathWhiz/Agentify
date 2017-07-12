class AddAboutToBusiness < ActiveRecord::Migration[5.0]
  def change
        add_column :businesses, :about, :text
  end
end
