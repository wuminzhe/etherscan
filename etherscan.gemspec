require_relative "lib/etherscan/version"

Gem::Specification.new do |spec|
    spec.name = "etherscan"
  spec.version = Etherscan::VERSION
  spec.authors = ["Aki Wu"]
  spec.email = ["wuminzhe@gmail.com"]

  spec.summary = "etherscan.io API wrapper, or, etherscan compatible API wrapper"
  spec.description = "etherscan.io API wrapper, or, etherscan compatible API wrapper"
  spec.homepage = "https://github.com/wuminzhe/etherscan"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
end
