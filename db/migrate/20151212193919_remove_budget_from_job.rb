class RemoveBudgetFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :budget, :money
  end
end
