$:.unshift File.expand_path("../lib", __FILE__)
require "hammer_cli_foreman_openscap/version"

Gem::Specification.new do |s|

  s.name = "hammer_cli_foreman_openscap"
  s.authors = ["The Foreman team"]
  s.version = HammerCLIForemanOpenscap.version.dup
  s.platform = Gem::Platform::RUBY
  s.summary = %q{Foreman OpenSCAP commands for Hammer}
  s.license = "GPL-3"
  s.files = Dir['lib/**/*.rb']
  s.require_paths = ["lib"]

  s.add_dependency 'hammer_cli_foreman', '~> 0.6'
end