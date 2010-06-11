namespace :radiant do
  namespace :extensions do
    namespace :asset_gallery do
      
      desc "Runs the migration of the Asset Gallery extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          AssetGalleryExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          AssetGalleryExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Asset Gallery to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from AssetGalleryExtension"
        Dir[AssetGalleryExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(AssetGalleryExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
