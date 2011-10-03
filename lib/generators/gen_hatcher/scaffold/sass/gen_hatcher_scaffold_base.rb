module GenHatcher
  module Sass
    module GenHatcherScaffoldBase
      def copy_stylesheet_base
        dir = GenHatcher::ScaffoldGenerator.source_root
        file = File.join(dir, "scaffold.css")
        converted_contents = ::Sass::CSS.new(File.read(file)).render(syntax)
        create_file "app/assets/stylesheets/scaffolds.css.#{syntax}", converted_contents
      end
    end
  end
end
