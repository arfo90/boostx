module Boostx
  module Core
    class Template
     def self.base_module_struc(project_name)
       basic_module = String.new
       pre_require = module_require
       module_require.each do |req|
         basic_module << req+"\n"
       end
       basic_module << "\n"
       basic_module << "module #{project_name}\n"
       basic_module << "\s## autoload classes here\nend"
       basic_module
     end

     def self.base_file_struc(file_name)
       p file_name
       basic_file = String.new
       basic_file << "module #{file_name}\n"
       basic_file << "\s## autoload classes here\nend\nend"
       basic_file
       p basic_file
     end

     def self.module_require
       pre_module_require = []
       pre_module_require << "$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))"
       pre_module_require << "require 'rubygems'"
       pre_module_require << "require 'bundler/setup'"
       pre_module_require << "Bundler.require(:default)"
       pre_module_require
     end
    end
  end
end
