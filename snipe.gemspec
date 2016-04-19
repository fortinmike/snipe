# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "snipe/info"

Gem::Specification.new do |spec|
  spec.name          = Snipe::NAME
  spec.version       = Snipe::VERSION
  spec.authors       = ["Michaël Fortin"]
  spec.email         = ["fortinmike@irradiated.net"]
  spec.summary       = Snipe::SUMMARY
  spec.description   = Snipe::DESCRIPTION
  spec.homepage      = "https://github.com/fortinmike/snipe"
  spec.license       = "MIT"
  
  spec.required_ruby_version = '~> 2.0'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "claide", "~> 0.8", ">= 0.8.0"
  spec.add_runtime_dependency "colored", "~> 1.2"
end
