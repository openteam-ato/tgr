class AddAttachmentMetaToDatasets < ActiveRecord::Migration
  def self.up
    change_table :datasets do |t|
      t.attachment :meta
    end
  end

  def self.down
    remove_attachment :datasets, :meta
  end
end
