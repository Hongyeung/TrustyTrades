class AddImageThreeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_three, :string
  end
end
