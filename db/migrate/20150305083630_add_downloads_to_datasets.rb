class AddDownloadsToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :downloads, :integer
  end
end
