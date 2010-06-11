# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
require_dependency "#{File.expand_path(File.dirname(__FILE__))}/lib/model_extensions/user_model_extension"
require_dependency "#{File.expand_path(File.dirname(__FILE__))}/lib/model_extensions/asset_model_extension"

class AssetGalleryExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/asset_gallery"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :galleries
    end
  end
  
  def activate
    # admin.nav[:content] << admin.nav_item(:asset_gallery, "Asset Gallery", "/admin/asset_gallery"), :after => :pages
  
    admin.nav[:content] << admin.nav_item(:galleries, "Gallery", "/admin/galleries")

    Page.send :include, GalleryTags

    User.send(:include, AssetGallery::UserModelExtension)
    Asset.send(:include, AssetGallery::AssetModelExtension)
  end
end
