class AddImageOneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_one, :string
  end
end
