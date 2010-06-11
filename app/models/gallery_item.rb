class GalleryItem < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :asset

  validates_presence_of :asset_id
end
