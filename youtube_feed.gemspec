# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtube_feed/version'

Gem::Specification.new do |spec|
  spec.name          = "youtube_feed"
  spec.version       = YoutubeFeed::VERSION
  spec.authors       = ["swati jadhav"]
  spec.email         = ["swati.nakshtra17@gmail.com"]

  spec.summary       = %q{Fetch youtube feeds in standard RSS format.}
  spec.description   = %q{Fetch youtube feeds in standard RSS format.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_development_dependency "nokogiri", "~> 1.7.0"
  spec.add_development_dependency "sax-machine", "~> 1.3.2"
  spec.add_development_dependency "faraday", "~> 0.10.1"

end
