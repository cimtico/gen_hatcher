require 'rails/generators/erb'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Erb
  module Generators
    class GenHatcherScaffoldGenerator < ::Erb::Generators::ScaffoldGenerator
      include ::GenHatcher::GenHatcherHelpers
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end

      def create_root_folder
        #empty_directory File.join("app/views", controller_file_path)
        super
      end

      def copy_view_files
        #available_views.each do |view|
        #  filename = filename_with_extensions(view)
        #  template filename, File.join("app/views", controller_file_path, filename)
        #end
        super
      end

      protected

      def available_views
        %w(index edit show new _form)
      end
    end
  end
end
