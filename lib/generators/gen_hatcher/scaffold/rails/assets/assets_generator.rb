require 'rails/generators/rails/assets/assets_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'
require 'generators/gen_hatcher/scaffold/js/assets/gen_hatcher_assets_generator'
require 'generators/gen_hatcher/scaffold/css/assets/gen_hatcher_assets_generator'
require 'generators/gen_hatcher/scaffold/coffee/assets/gen_hatcher_assets_generator'
require 'generators/gen_hatcher/scaffold/sass/sass/assets/gen_hatcher_assets_generator'
require 'generators/gen_hatcher/scaffold/sass/scss/assets/gen_hatcher_assets_generator'

module gen_hatcher
  class AssetsGenerator < Rails::Generators::AssetsGenerator
    include gen_hatcherHelpers
    
    def initialize(*args)
      @file_path = __FILE__
      super(*args)
      set_source_paths
    end

    remove_hook_for :javascript_engine
    remove_hook_for :stylesheet_engine
    
    hook_for :javascript_engine, :as => :gen_hatcher_assets do |javascript_engine|
      invoke javascript_engine, [name] if options[:javascripts]
    end

    hook_for :stylesheet_engine, :as => :gen_hatcher_assets do |stylesheet_engine|
      invoke stylesheet_engine, [name] if options[:stylesheets]
    end

  end
end

