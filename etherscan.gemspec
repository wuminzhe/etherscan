# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'etherscan'
  spec.version       = '0.1.4'
  spec.authors       = ['wuminzhe']
  spec.email         = ['wuminzhe@gmail.com']
  spec.description   = 'Forked from: https://github.com/sebs/etherscanio-rb. 3rd party using to the API at etherscan.io'
  spec.summary       = '3rd party using to the API at etherscan.io'
  spec.homepage      = 'https://github.com/wuminzhe/etherscan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.extra_rdoc_files = ['README.md']

  spec.add_dependency 'faraday', '0.9.2'
  spec.add_dependency 'json', '2.1.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'webmock'
end
