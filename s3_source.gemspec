# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3_source/version'

Gem::Specification.new do |spec|
  spec.name          = "s3_source"
  spec.version       = S3Source::VERSION
  spec.authors       = ["Darrick Wiebe"]
  spec.email         = ["dw@xnlogic.com"]
  spec.summary       = %q{Monkeypatch RubyGems with s3 gem support}
  spec.description   = %q{This just fixes the current partial implementation}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "xn_gem_release_tasks"
end
