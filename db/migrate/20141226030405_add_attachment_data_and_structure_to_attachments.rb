class AddAttachmentDataAndStructureToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :data
      t.attachment :structure
    end
  end

  def self.down
    remove_attachment :attachments, :structure
    remove_attachment :attachments, :data
  end
end
