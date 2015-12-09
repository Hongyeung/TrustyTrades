class CreateContractorTaggings < ActiveRecord::Migration
  def change
    create_table :contractor_taggings do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
