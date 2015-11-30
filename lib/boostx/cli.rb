require 'thor'
require_relative 'core/builder'

module Boostx
  class Cli < Thor
    desc 'initializing project base', '--init'
    def init(project_name)
      builder = Boostx::Core::Builder.new
      builder.init(project_name)
    end
  end
end
