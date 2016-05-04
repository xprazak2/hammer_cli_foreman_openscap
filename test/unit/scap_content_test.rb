ENV['TEST_API_VERSION'] = '1.11'

require File.join(Gem.loaded_specs['hammer_cli_foreman'].full_gem_path, 'test/unit/test_helper')
require File.join(File.dirname(__FILE__), '..', 'compliance_resource_mock')
require 'hammer_cli_foreman_openscap/scap_content'

describe HammerCLIForemanOpenscap::ScapContent do
  include CommandTestHelper

  context "ListCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ScapContent::ListCommand.new "", ctx }

    before :each do
      ComplianceResourceMock.scap_contents_list
    end

    context "parameters" do
      it_should_accept "no arguments"
      it_should_accept_search_params
    end

    context "output" do
      let(:expected_record_count) { cmd.resource.call(:index).length }
      it_should_print_n_records
      it_should_print_columns ["Id", "Title"]
    end
  end

  context "DeleteCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ScapContent::DeleteCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end
  end

  context "UpdateCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ScapContent::UpdateCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end
  end
end
