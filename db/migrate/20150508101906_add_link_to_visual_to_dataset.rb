class AddLinkToVisualToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :link_to_visual, :string
  end
end
