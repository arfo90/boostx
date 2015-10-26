require_relative '../lib/boost'

build = Boost::Core::Builder.new

#  build.make_dir('thisistest')

build.init('test_project')
