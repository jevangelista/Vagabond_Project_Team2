class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :users, :city
  	remove_column :posts, :city
  end
end
