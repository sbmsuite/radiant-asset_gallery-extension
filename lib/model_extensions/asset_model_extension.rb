module AssetGallery
  module AssetModelExtension
    def self.included(base)
      base.class_eval {
        has_many  :galleries, :dependent => :destroy
      }
    end
  end
end
