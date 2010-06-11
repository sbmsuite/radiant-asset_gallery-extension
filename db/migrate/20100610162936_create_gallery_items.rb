class CreateGalleryItems < ActiveRecord::Migration
  def self.up
    create_table :gallery_items do |t|
      t.integer :gallery_id
      t.integer :asset_id
      t.string :caption, :limit => 255
      t.timestamps
    end
  end

  def self.down
    drop_table :gallery_items
  end
end
