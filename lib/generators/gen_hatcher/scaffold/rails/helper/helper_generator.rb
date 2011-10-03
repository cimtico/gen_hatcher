require 'rails/generators/rails/helper/helper_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'

module gen_hatcher
  class HelperGenerator < Rails::Generators::HelperGenerator
    include gen_hatcherHelpers
    
    def initialize(*args)
      @file_path = __FILE__
      super(*args)
      set_source_paths
    end

    def create_helper_files
      #template 'helper.rb', File.join('app/helpers', class_path, "#{file_name}_helper.rb")
      super
    end

    hook_for :test_framework
  end
end
