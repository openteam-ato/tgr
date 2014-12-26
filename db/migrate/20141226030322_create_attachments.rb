class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :dataset, index: true
      t.timestamps
    end
  end
end
