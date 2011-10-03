require 'rails/generators/js/assets/assets_generator'

module Js
  module Generators
    class GenHatcherAssetsGenerator < ::Js::Generators::AssetsGenerator
      include ::GenHatcher::GenHatcherHelpers
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end

      def copy_javascript
        #dir = Rails::Generators::ScaffoldGenerator.source_root
        #file = File.join(dir, "scaffold.css")
        #create_file "app/assets/stylesheets/scaffold.css", File.read(file)
        copy_file "scaffold.css", app/assets/stylesheets/scaffold.css
        super
      end
    end
  end
end
