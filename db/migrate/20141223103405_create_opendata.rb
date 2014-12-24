class CreateOpendata < ActiveRecord::Migration
  def change
    create_table :opendata do |t|

      t.timestamps
    end
  end
end
