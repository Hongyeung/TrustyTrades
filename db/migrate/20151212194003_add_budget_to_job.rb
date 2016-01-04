class AddBudgetToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :budget, :integer
  end
end
