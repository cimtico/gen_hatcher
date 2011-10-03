require 'rails/generators/scss/assets/assets_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'

module Scss
  module Generators
    class gen_hatcherAssetsGenerator < Scss::Generators::AssetsGenerator
      include ::gen_hatcher::gen_hatcherHelpers
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end

      def copy_scss
        #template "stylesheet.css.scss", File.join('app/assets/stylesheets', class_path, "#{file_name}.css.scss")
        super
      end
    end
  end
end
