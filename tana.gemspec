# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "tana"
  spec.version = "0.10.0"
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://alchemists.io/projects/tana"
  spec.summary = "A monadic API client for the Tana Personal Knowledge Management system."
  spec.license = "Hippocratic-2.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/tana/issues",
    "changelog_uri" => "https://alchemists.io/projects/tana/versions",
    "homepage_uri" => "https://alchemists.io/projects/tana",
    "funding_uri" => "https://github.com/sponsors/bkuhlmann",
    "label" => "Tana",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/bkuhlmann/tana"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = ">= 3.3", "<= 3.4"
  spec.add_dependency "containable", "~> 0.2"
  spec.add_dependency "core", "~> 1.7"
  spec.add_dependency "dry-monads", "~> 1.6"
  spec.add_dependency "dry-validation", "~> 1.10"
  spec.add_dependency "http", "~> 5.1"
  spec.add_dependency "infusible", "~> 3.8"
  spec.add_dependency "pipeable", "~> 0.5"
  spec.add_dependency "refinements", "~> 12.9"
  spec.add_dependency "zeitwerk", "~> 2.7"

  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.files = Dir["*.gemspec", "lib/**/*"]
end
