class ChangeColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :current_city, :city_name
  	rename_column :posts, :city, :city_name
  end
end
