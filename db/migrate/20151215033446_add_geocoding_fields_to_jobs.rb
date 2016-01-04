class AddGeocodingFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :address, :string
    add_column :jobs, :longitude, :float
    add_column :jobs, :latitude, :float
  end
end
