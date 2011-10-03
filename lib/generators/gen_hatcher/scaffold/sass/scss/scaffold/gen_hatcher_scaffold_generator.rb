require 'rails/generators/scss/scaffold/scaffold_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'
require 'generators/gen_hatcher/scaffold/sass/gen_hatcher_scaffold_base'

module Scss
  module Generators
    class gen_hatcherScaffoldGenerator < Scss::Generators::ScaffoldGenerator
      # In order to allow the Sass generators to pick up the default Rails CSS and
      # transform it, we leave it in a standard location for the CSS stylesheet
      # generators to handle. For the simple, default case, just copy it over.
      include ::gen_hatcher::gen_hatcherHelpers
      include ::gen_hatcher::Sass::gen_hatcherScaffoldBase
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end
      
      def copy_stylesheet
        copy_stylesheet_base
      end
    end
  end
end
