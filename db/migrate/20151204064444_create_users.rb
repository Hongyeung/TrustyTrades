class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.string :phone_number
      t.boolean :contractor
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
