# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'letsencrypt_rack/version'

Gem::Specification.new do |spec|
  spec.name          = "letsencrypt_rack"
  spec.version       = LetsencryptRack::VERSION
  spec.authors       = ["Johannes Opper"]
  spec.email         = ["johannes.opper@gmail.com"]

  spec.summary       = %q{Rack middleware to respond to letsencrypt challenges}
  spec.description   = %q{Rack middleware to respond to letsencrypt challenges}
  spec.homepage      = "https://github.com/xijo/letsencrypt_rack"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "> 1.12"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec"
end
