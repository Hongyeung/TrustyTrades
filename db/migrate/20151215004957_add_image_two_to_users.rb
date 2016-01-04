class AddImageTwoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_two, :string
  end
end
