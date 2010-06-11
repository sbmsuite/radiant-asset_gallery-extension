class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :user_id
      t.string :name, :limit => 255
      t.string :caption, :limit => 255
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
