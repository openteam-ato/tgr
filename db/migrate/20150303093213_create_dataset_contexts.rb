class CreateDatasetContexts < ActiveRecord::Migration
  def change
    create_table :dataset_contexts do |t|
      t.string :title
      t.string :ancestry
      t.string :weight

      t.timestamps
    end
    add_index :dataset_contexts, :ancestry
    add_index :dataset_contexts, :weight
  end
end
