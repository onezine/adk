class AddAttachmentImageToAvailabilities < ActiveRecord::Migration
  def self.up
    change_table :availabilities do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :availabilities, :image
  end
end
