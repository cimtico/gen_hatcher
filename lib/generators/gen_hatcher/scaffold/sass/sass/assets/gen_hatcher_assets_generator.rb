require 'rails/generators/sass/assets/assets_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'

module Sass
  module Generators
    class gen_hatcherAssetsGenerator < Sass::Generators::AssetsGenerator
      include ::gen_hatcher::gen_hatcherHelpers
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end

      def copy_sass
        #template "stylesheet.css.sass", File.join('app/assets/stylesheets', class_path, "#{file_name}.css.sass")
        super
      end
    end
  end
end
