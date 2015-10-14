$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

Bundler.require(:default, :api)
module Boosts

  module Core
   autoload :Builder, 'boost/core/builder.rb'
  end
end
