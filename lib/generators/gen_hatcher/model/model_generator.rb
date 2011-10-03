require 'rails/generators/active_record/model/model_generator'
require 'generators/gen_hatcher/gen_hatcher_helpers'

module gen_hatcher
  class ModelGenerator < ActiveRecord::Generators::ModelGenerator
    include gen_hatcherHelpers
    
    def initialize(*args)
      @file_path = __FILE__
      super(*args)
      set_source_paths
    end
    
    def create_migration_file
      begin
        super
      rescue => exception
        #Delete migration file due to an exception during it's generation
        migration_dir = File.expand_path("db/migrate/", self.destination_root)
        file_path = File.join(migration_dir, "#{@migration_number}_#{@migration_file_name}.rb")
        File.delete(file_path) if File.exists?(file_path)
        raise exception
      end
    end

    def create_model_file
      begin
        super
      rescue => exception
        #Delete model file due to an exception during it's generation
        file_path = File.join('app/models', class_path, "#{file_name}.rb")
        File.delete(file_path) if File.exists?(file_path)
        raise exception
      end
    end

    def create_module_file
      begin
        super
      rescue => exception
        #Delete model file due to an exception during it's generation
        file_path = File.join('app/models', "#{class_path.join('/')}.rb")
        File.delete(file_path) if File.exists?(file_path)
        raise exception
      end
    end
  end
end

