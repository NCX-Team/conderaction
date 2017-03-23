# -*- encoding: UTF-8 -*-
require File.expand_path('../lib/conderaction/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'conderaction'
  s.version = Conderaction::VERSION
  s.summary = 'DCI for Ruby on Rails'
  s.description = 'Allows you to follow DCI principles in Ruby on Rails'

  s.authors = ['Nathan Palmer', 'Brian Knight']
  s.email = ['nathan@nathanpalmer.com']
  s.homepage = 'https://github.com/sprucemail/conderaction'
  s.license = 'MIT'

  s.files = ['lib/conderaction.rb',
            'lib/dci/context.rb',
            'lib/dci/data.rb',
            'lib/conderaction/version.rb',
            'LICENSE',
            'README.md']

  s.test_files = ['test/test_helper.rb',
                  'test/data_test.rb',
                  'test/context_test.rb']

  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency 'casting', '~> 0.7'

  s.add_development_dependency 'minitest-rspec_mocks'
end
