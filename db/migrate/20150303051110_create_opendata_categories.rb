class CreateOpendataCategories < ActiveRecord::Migration
  def change
    create_table :opendata_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
