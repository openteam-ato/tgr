class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.belongs_to :opendata, index: true
      t.string :tracking_number
      t.text :title
      t.text :description
      t.text :owner
      t.text :responsible
      t.string :phone
      t.string :email
      t.date :first_publish_date
      t.date :last_update_date
      t.text :last_update_description
      t.date :relevance_date
      t.text :keywords
      t.string :version_guidelines

      t.timestamps
    end
  end
end
