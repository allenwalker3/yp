# -*- encoding: utf-8 -*-
require File.expand_path('../lib/yp/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Allen Walker"]
  gem.email         = ["auswalk@gmail.com"]
  gem.description   = %q{Simple ruby wrapper for YP.com API}
  gem.summary       = %q{Simple ruby wrapper for YP.com API}
  gem.homepage      = "http://github.com/auswalk/yp"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "yp"
  gem.require_paths = ["lib"]
  gem.version       = Yp::VERSION

  gem.add_dependency('rails', '>= 3.0')
  gem.add_dependency('faraday', ["< 0.8", ">= 0.6"])	
  gem.add_dependency('faraday_middleware', [">= 0.8"])	
end
