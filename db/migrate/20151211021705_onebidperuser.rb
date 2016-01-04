class Onebidperuser < ActiveRecord::Migration
  def change
    add_index :bids, [:user_id, :job_id], unique: true
  end
end
