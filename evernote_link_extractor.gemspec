# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'evernote_link_extractor/version'

Gem::Specification.new do |spec|
  spec.name          = "evernote_link_extractor"
  spec.version       = EvernoteLinkExtractor::VERSION
  spec.authors       = ["Andy Wenk"]
  spec.email         = ["andy@nms.de"]
  spec.licenses      = ['Apache Version 2.0']

  spec.summary       = %q{Extract links from your exported Evernote notes}
  spec.description   = %q{This gem creates a CSV file with links from your exported Evernote notes in HTML files.}
  spec.homepage      = "https://github.com/andywenk/evernote_link_extractor"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "pastel"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
