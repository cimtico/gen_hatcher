require 'rails/generators/css/assets/assets_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'

module Css
  module Generators
    class gen_hatcherAssetsGenerator < ::Css::Generators::AssetsGenerator
      include ::gen_hatcher::gen_hatcherHelpers
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end

      def copy_stylesheet
        #copy_file "stylesheet.css", File.join('app/assets/stylesheets', class_path, "#{file_name}.css")
        super
      end
    end
  end
end
