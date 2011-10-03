require 'rails/generators/resource_helpers'
require 'generators/gen_hatcher/model/model_generator'

module gen_hatcher
    class ResourceGenerator < gen_hatcher::ModelGenerator #metagenerator
      include Rails::Generators::ResourceHelpers

      hook_for :resource_controller, :required => true do |controller|
        invoke controller, [ controller_name, options[:actions] ]
      end

      class_option :actions, :type => :array, :banner => "ACTION ACTION", :default => [],
                             :desc => "Actions for the resource controller"

      def add_resource_route
        return if options[:actions].present?
        route_config =  regular_class_path.collect{|namespace| "namespace :#{namespace} do " }.join(" ")

        indent = route_config.empty? ? '' : "  "
        route_config << "#{indent}resources :#{file_name.pluralize} do\n"
        route_config << "#{indent}    collection do\n"
        route_config << "#{indent}      get :grid_json\n"
        route_config << "#{indent}      post :post_data\n"
        route_config << "#{indent}    end\n"
        route_config << "#{indent}  end\n"
    
        route_config << " end" * regular_class_path.size
        route route_config
      end
    end
end
