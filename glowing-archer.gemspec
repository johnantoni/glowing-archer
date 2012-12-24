# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glowing-archer/version'

Gem::Specification.new do |gem|
  gem.name          = "glowing-archer"
  gem.version       = Glowing::Archer::VERSION
  gem.authors       = ["John Griffiths"]
  gem.email         = ["john@johnantoni.com"]
  gem.description   = %q{collection of frequently used core extensions for ruby}
  gem.summary       = %q{addons to help arrays, strings, etc. i keep on using}
  gem.homepage      = "https://github.com/johnantoni/glowing-archer"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end
