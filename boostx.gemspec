# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require 'boostx/version'

Gem::Specification.new do |spec|
  spec.name          = "boostx"
  spec.version       = "0.0.1" #Boostx::VERSION
  spec.authors       = ["Amireza Fatemi"]
  spec.email         = ["arfo.amireza@gmail.com"]
  spec.summary       = "Boostx is ruby project template generator."
  spec.description   = "Boostx ables users to create their desire template and it generat new projects based on template"
  spec.homepage      = "https://github.com/arfo90/boostx"
  spec.license       = "MIT"

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = []
  spec.require_paths = ["lib"]

  spec.add_dependency('thor', '> 0.19.1')

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8.1"
  spec.add_development_dependency "mocha", "~> 1.1.0"
  spec.add_development_dependency "fakefs", "~> 0.6.7"
end
