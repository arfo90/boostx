begin
  require 'psych'
  rescue ::LoadError
end

require 'fileutils'
require 'yaml/store'

module Boostx
  module Core
    class Builder
      def make_dir(folder_name)
        FileUtils::mkdir_p folder_name
      end

      def make_file(file_name, path = Dir.pwd, extension = '.rb', content = nil)
        unless File.directory?(path)
          self.make_dir(path)
        end

        if path != Dir.pwd
          path << '/'
        else
          path = ''
        end

        path << "#{file_name}#{extension}"

        new_file = File.new(path, 'w')
        new_file.write(content) unless content.nil?
        new_file.close
      end

      def init(project_name)
        directions = ['lib', "lib/#{project_name}"]
        directions.each do |dir|
          self.make_dir(dir)
        end
        make_file('Gemfile', Dir.pwd, '')
        

        create_yaml(project_name)
        create_module(project_name)
      end

      private

      def create_module(project_name)
        module_content = Boostx::Core::Template.base_module_struc(project_name.capitalize)
        make_file("#{project_name}", 'lib', '.rb', module_content.to_s)
      end

      def create_yaml(project_name = nil)
       yaml_file = YAML::Store.new '.boostx'
       yaml_file.transaction do
         yaml_file['project_name'] = project_name
         yaml_file['module_name'] = project_name
         yaml_file['module_dir'] = "#{Dir.pwd}/lib/#{project_name}"
       end
      end
    end
  end
end
