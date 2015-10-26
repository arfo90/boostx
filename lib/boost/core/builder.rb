require 'fileutils'

module Boost
  module Core
    class Builder
      def initialize
      end

      def make_dir(folder_name)
        FileUtils::mkdir_p folder_name
      end

      def make_file(file_name, path = Dir.pwd, extension = '.rb')
        unless File.directory?(path)
          self.make_dir(path)
        end

        if path != Dir.pwd
          path << '/'
        end

        path << "#{file_name}#{extension}"

        new_file = File.new(path, 'w')
        new_file.close
      end

      def init(project_name)
        # make_file('Gemfile', Dir.pwd, '')
        make_dir('lib')
        make_dir("lib/#{project_name}")
        make_file("#{project_name}", 'lib')
      end
    end
  end
end
