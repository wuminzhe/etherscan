lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'etherscan'
  spec.version       = '0.2.0'
  spec.authors       = ['Aki Wu']
  spec.email         = ['wuminzhe@gmail.com']
  spec.description   = 'etherscan.io API wrapper, or, etherscan compatible API wrapper'
  spec.summary       = 'etherscan.io API wrapper, or, etherscan compatible API wrapper'
  spec.homepage      = 'https://github.com/wuminzhe/etherscan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.extra_rdoc_files = ['README.md']
end
