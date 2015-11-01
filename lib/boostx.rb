$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

module Boostx
  autoload :Cli, 'boostx/cli.rb'

  module Core
   autoload :Builder, 'boostx/core/builder.rb'
  end

  module Version
    autoload :Version, 'boostx/version.rb'
  end
end
