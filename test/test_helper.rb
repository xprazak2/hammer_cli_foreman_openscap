ENV['TEST_API_VERSION'] = '1.15'
FOREMAN_OPENSCAP_VERSION = Gem::Version.new(ENV['TEST_API_VERSION'])

require 'minitest/autorun'
require 'minitest/spec'
require "minitest-spec-context"
require "mocha/minitest"
require 'hammer_cli'

if HammerCLI.context[:api_connection]
  HammerCLI.context[:api_connection].create('foreman') do
    HammerCLI::Apipie::ApiConnection.new(
      :apidoc_cache_dir => 'test/data/' + FOREMAN_OPENSCAP_VERSION.to_s,
      :apidoc_cache_name => 'foreman_api',
      :dry_run => true
    )
  end
else
  HammerCLIForeman.stubs(:resource_config).returns(
    :apidoc_cache_dir => 'test/data/' + FOREMAN_OPENSCAP_VERSION.to_s,
    :apidoc_cache_name => 'foreman_api',
    :dry_run => true
  )
end

require 'hammer_cli_foreman_openscap'
