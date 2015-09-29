class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email
    	t.string :password_digest
    	t.string :first_name
    	t.string :last_name
    	t.string :city
    	t.integer :city_id
    	t.timestamps null: false
    end
    create_table :posts do |t|
    	t.string :title
    	t.text :content
    	t.string :city
    	t.integer :city_id
    	t.integer :user_id
    	t.timestamps null: false
    end
    create_table :cities do |t|
    	t.string :name
    	t.string :imgurl
    	t.timestamps null: false
    end
  end
end
