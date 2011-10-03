module GenHatcher
  module GenHatcherHelpers
    def set_source_paths
      @source_paths ||= []
      templates = File.expand_path('../templates', @file_path || __FILE__)
      @source_paths << templates unless @source_paths.include? templates
    end
  end
end
