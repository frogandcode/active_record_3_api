# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_3_api/version'

Gem::Specification.new do |gem|
  gem.name          = "active_record_3_api"
  gem.version       = ActiveRecord3Api::VERSION
  gem.authors       = ["Rich Thornett"]
  gem.email         = ["rich@thornett.com"]
  gem.description   = %q{Allows Rails 2 applications using Rails >= 2.3.8 to make use of the newer Active Record 3 query interface in Rails 3.}
  gem.summary       = %q{Active Record 3 query interface for Rails 2 apps}
  gem.homepage      = "https://github.com/frogandcode/active_record_3_api"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activerecord", "~> 2.3.8"
  gem.add_development_dependency "sqlite3-ruby"
  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "mocha", "~> 0.12.7"
  gem.add_development_dependency "rake"
end
