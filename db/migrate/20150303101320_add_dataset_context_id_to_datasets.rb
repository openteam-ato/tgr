class AddDatasetContextIdToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :dataset_context_id, :integer
  end
end
