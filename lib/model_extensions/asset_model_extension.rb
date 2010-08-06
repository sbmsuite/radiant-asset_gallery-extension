module AssetGallery
  module AssetModelExtension
    def self.included(base)
      base.class_eval {
        has_many  :galleries, :dependent => :destroy
	has_many :gallery_items, :dependent => :destroy
      }
    end
  end
end
