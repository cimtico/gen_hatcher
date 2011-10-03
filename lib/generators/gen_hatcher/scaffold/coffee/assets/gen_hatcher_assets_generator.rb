require 'rails/generators/coffee/assets/assets_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'
require "execjs/runtimes"

module Coffee
  module Generators
    class gen_hatcherAssetsGenerator < ::Coffee::Generators::AssetsGenerator
      include ::gen_hatcher::gen_hatcherHelpers
    
      def initialize(*args)
        @file_path = __FILE__
        super(*args)
        set_source_paths
      end
      
      def validate_runtime
        begin
          Runtimes.autodetect
        rescue => ex
          puts 'No Js runtime detected. For more information see:'
          puts 'https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager'
        end
      end

      def copy_coffee
        #template "javascript.js.coffee", File.join('app/assets/javascripts', class_path, "#{file_name}.js.coffee")
        super
      end
    end
  end
end
