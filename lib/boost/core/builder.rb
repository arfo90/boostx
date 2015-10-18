require 'fileutils'

module Boost
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
        end

        path << "#{file_name}#{extension}"
        new_file = File.new(path, 'w')
        new_file.close
      end
    end
  end
end
