ENV['TEST_API_VERSION'] = '1.15'

require File.join(Gem.loaded_specs['hammer_cli_foreman'].full_gem_path, 'test/unit/test_helper')
require_relative 'compliance_resource_mock'
require 'hammer_cli_foreman_openscap/id_resolver'
require 'hammer_cli_foreman_openscap/commands'
require 'hammer_cli_foreman_openscap/arf_report'
require 'hammer_cli_foreman_openscap/policy'
require 'hammer_cli_foreman_openscap/scap_content'
