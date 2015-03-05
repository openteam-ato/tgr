class AddVisitsToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :visits, :integer
  end
end
