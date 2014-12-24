class AddAttachmentListToOpendata < ActiveRecord::Migration
  def self.up
    change_table :opendata do |t|
      t.attachment :list
    end
  end

  def self.down
    remove_attachment :opendata, :list
  end
end
