require 'rails/generators/rails/scaffold/scaffold_generator'
require 'generators/gen_hatcher/scaffold/rails/resource/resource_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'
require 'generators/gen_hatcher/scaffold/rails/scaffold_controller/scaffold_controller_generator'
require 'generators/gen_hatcher/scaffold/rails/assets/assets_generator'

#require 'generators/gen_hatcher/scaffold/js/scaffold/gen_hatcher_scaffold_generator'
#require 'generators/gen_hatcher/scaffold/coffee/scaffold/gen_hatcher_scaffold_generator'
require 'generators/gen_hatcher/scaffold/css/scaffold/gen_hatcher_scaffold_generator'
require 'generators/gen_hatcher/scaffold/sass/sass/scaffold/gen_hatcher_scaffold_generator'
require 'generators/gen_hatcher/scaffold/sass/scss/scaffold/gen_hatcher_scaffold_generator'

module gen_hatcher
  class ScaffoldGenerator < gen_hatcher::ResourceGenerator #metagenerator
    include gen_hatcherHelpers
    
    def initialize(*args)
      @file_path = __FILE__
      super(*args)
      set_source_paths
    end
    
    remove_hook_for :resource_controller
    remove_class_option :actions

    class_option :stylesheets, :type => :boolean, :desc => "Generate Stylesheets"
    class_option :stylesheet_engine, :desc => "Engine for Stylesheets"

    hook_for :scaffold_controller, :required => true

    hook_for :assets, :as => :gen_hatcher_assets do |assets|
      invoke assets, [controller_name]
    end

    hook_for :stylesheet_engine, :as => :gen_hatcher_scaffold do |stylesheet_engine|
      invoke stylesheet_engine, [controller_name] if options[:stylesheets] && behavior == :invoke
    end
    
    protected
    
    def self.source_root
      file_path = __FILE__
      File.expand_path('../templates', file_path || __FILE__)
    end
    
  end
end
