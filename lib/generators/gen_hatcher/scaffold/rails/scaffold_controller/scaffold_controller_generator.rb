require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'
require 'generators/gen_hatcher/scaffold/rails/helper/helper_generator'
require 'generators/gen_hatcher/scaffold/erb/scaffold/gen_hatcher_scaffold_generator'

module gen_hatcher
  class ScaffoldControllerGenerator < Rails::Generators::ScaffoldControllerGenerator
    include gen_hatcherHelpers
    
    def initialize(*args)
      @file_path = __FILE__
      super(*args)
      set_source_paths
    end

    def create_controller_files
      #template 'controller.rb', File.join('app/controllers', class_path, "#{controller_file_name}_controller.rb")
      super
    end

    remove_hook_for :template_engine
    hook_for :template_engine, :as => :gen_hatcher_scaffold
   
    # Invoke the helper using the controller name (pluralized)
    hook_for :helper, :as => :scaffold do |invoked|
      invoke invoked, [ controller_name ]
    end
  end
end

