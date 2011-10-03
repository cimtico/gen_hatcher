require 'rails/generators/css/scaffold/scaffold_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'

module Css
  module Generators
    class gen_hatcherScaffoldGenerator < ::Css::Generators::ScaffoldGenerator
      # In order to allow the Sass generators to pick up the default Rails CSS and
      # transform it, we leave it in a standard location for the CSS stylesheet
      # generators to handle. For the simple, default case, just copy it over.
      include ::gen_hatcher::gen_hatcherHelpers
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end
      
      def copy_stylesheet
        #dir = Rails::Generators::ScaffoldGenerator.source_root
        #file = File.join(dir, "scaffold.css")
        #create_file "app/assets/stylesheets/scaffold.css", File.read(file)
        super
      end
    end
  end
end
