$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

module Boost

  module Core
   autoload :Builder, 'boost/core/builder.rb'
  end
end
