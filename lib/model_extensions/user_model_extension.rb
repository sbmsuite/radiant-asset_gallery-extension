module AssetGallery
  module UserModelExtension
    def self.included(base)
      base.class_eval {
        has_many  :galleries
      }
    end
  end
end
