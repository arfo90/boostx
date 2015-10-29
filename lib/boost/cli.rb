require 'thor'

module Boost
  class Cli < Thor
    def initialize
      @builder = Boost::Core::Builder.new
    end

    desc 'initializing project base', '--init'
    def init(project_name)
      @builder.init(project_name)
    end
  end
end

#
# require 'thor'
#
# class MyCli < Thor
#   desc 'hello, just test', 'say hello'
#   option :from
#   def hello(name)
#     puts name
#     puts "from #{options[:from]}" if options[:from]
#   end
# end
#
# MyCli.start(ARGV)
