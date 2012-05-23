# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mediainfo-simple/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mediainfo-simple'
  s.version     = Mediainfo::VERSION
  s.platform    = Gem::Platform::RUBY

  s.authors     = ['Grayson Manley']
  s.email       = %w[gray.manley@gmail.com]

  s.homepage    = 'http://github.com/gmanley/mediainfo-simple'
  s.summary     = %q{Simple ruby wrapper for the Mediainfo CLI}
  s.description = %q{Simple ruby wrapper for the Mediainfo CLI}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = %w[lib]

  s.add_runtime_dependency('nori', ['~> 1.1.0'])
  s.add_development_dependency('rspec')
end
