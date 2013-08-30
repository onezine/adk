class AddAttachmentImageToFloorplans < ActiveRecord::Migration
  def self.up
    change_table :floorplans do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :floorplans, :image
  end
end
