require 'fileutils'
require 'yaml/store'

module Boostx
  module Core
    class Builder
      def make_dir(folder_name)
        FileUtils::mkdir_p folder_name
      end

      def make_file(file_name, path = Dir.pwd, extension = '.rb')
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
        new_file.close
      end

      def init(project_name)
        directions = ['lib', "lib/#{project_name}"]
        directions.each do |dir|
          self.make_dir(dir)
        end
        make_file("#{project_name}", 'lib')
        make_file('Gemfile', Dir.pwd, '')

        create_yaml
      end

      private

      def create_yaml
       yaml_file = YAML::Store.new '.boostx'
       yaml_file.transaction do
         yaml_file['project_name'] = 'project_name'
       end
      end
    end
  end
end
