# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xss_defense/version"

Gem::Specification.new do |s|
  s.name        = "xss_defense"
  s.version     = XssDefense::VERSION
  s.authors     = ["Paul Russell"]
  s.email       = ["paul@pauljamesrussell.org"]
  s.homepage    = "http://github.com/pauljamesrussell/xss_defense"
  s.summary     = %q{Rails plugin providing automatic defense from cross site scripting}
  s.description = %q{Rails plugin providing automatic defense from cross site scripting, through automatic white-list validation of all string fields}

  s.rubyforge_project = "xss_defense"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'activerecord', '>=3.0.0'
  s.add_development_dependency 'rspec', '>=2.5.0'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'sqlite3'
end
