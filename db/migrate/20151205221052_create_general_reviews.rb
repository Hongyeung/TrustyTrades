class CreateGeneralReviews < ActiveRecord::Migration
  def change
    create_table :general_reviews do |t|
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.integer :rating
      t.string :name
      t.text :body

      t.timestamps null: false
    end
  end
end
