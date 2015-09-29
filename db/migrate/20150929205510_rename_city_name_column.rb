class RenameCityNameColumn < ActiveRecord::Migration
   def change
  	rename_column :posts, :city_name, :city_id
  end
end
