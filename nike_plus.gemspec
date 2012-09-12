# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nike_plus/version'

Gem::Specification.new do |gem|
  gem.name          = "nike_plus"
  gem.version       = NikePlus::VERSION
  gem.authors       = ["John Barton"]
  gem.email         = ["jb@phy5ics.com"]
  gem.description   = %q{A serial interface to communicate with Nike+ devices}
  gem.summary       = %q{A serial interface to communicate with Nike+ devices. It will detect all Nike+ devices in the area and provide realtime notifications of events.}
  gem.homepage      = "http://github.com/physics/nike_plus"

  gem.add_dependency 'serialport'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
