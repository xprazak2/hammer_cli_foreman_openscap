ENV['TEST_API_VERSION'] = '1.11'

require File.join(Gem.loaded_specs['hammer_cli_foreman'].full_gem_path, 'test/unit/test_helper')
require File.join(File.dirname(__FILE__), '..', 'compliance_resource_mock')
require 'hammer_cli_foreman_openscap/policy'

describe HammerCLIForemanOpenscap::Policy do
  include CommandTestHelper

  context "ListCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::Policy::ListCommand.new "", ctx }

    before :each do
      ComplianceResourceMock.policies_list
    end

    context "parameters" do
      it_should_accept "no arguments"
      it_should_accept_search_params
    end

    context "output" do
      let(:expected_record_count) { cmd.resource.call(:index).length }
      it_should_print_n_records
      it_should_print_columns ["Id", "Name", "Created at"]
    end
  end

  context "InfoCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::Policy::InfoCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
      it_should_accept "name", ["--name=super_policy"]
    end

    context "output" do
      with_params ["--id=1"] do
        it_should_print_n_records 1
        it_should_print_columns ["Id", "Name", "Created at", "Period", "Weekday", "Cron line", "Scap content Id", "Scap Content profile Id"]
      end
    end
  end

  context "DeleteCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::Policy::DeleteCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
      it_should_accept "name", ["--name=bad_policy"]
    end
  end

  context "UpdateCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::Policy::UpdateCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
      it_should_accept "name", ["--name=bad_policy"]
    end
  end
end
