class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.money :budget
      t.string :name
      t.text :description
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
