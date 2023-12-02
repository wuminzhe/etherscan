Gem::Specification.new do |spec|
  spec.name          = 'etherscan'
  spec.version       = '0.2.0'
  spec.authors       = ['Aki Wu']
  spec.email         = ['wuminzhe@gmail.com']
  spec.description   = 'etherscan.io API wrapper, or, etherscan compatible API wrapper'
  spec.summary       = 'etherscan.io API wrapper, or, etherscan compatible API wrapper'
  spec.homepage      = 'https://github.com/wuminzhe/etherscan'
  spec.license       = 'MIT'

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir = 'exe'

  spec.require_paths = ['lib']
end
