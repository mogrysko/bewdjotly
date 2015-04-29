class AddAttachmentPhotoToJots < ActiveRecord::Migration
  def self.up
    change_table :jots do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :jots, :photo
  end
end
