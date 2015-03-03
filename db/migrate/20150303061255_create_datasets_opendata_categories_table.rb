class CreateDatasetsOpendataCategoriesTable < ActiveRecord::Migration
  def up
    create_table :datasets_opendata_categories, :id => false do |t|
      t.references :dataset
      t.references :opendata_category
    end
    add_index :datasets_opendata_categories, :dataset_id
    add_index :datasets_opendata_categories, :opendata_category_id
  end

  def down
    drop_table :datasets_opendata_categories
  end
end
