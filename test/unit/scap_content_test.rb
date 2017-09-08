require File.join(File.dirname(__FILE__), 'test_helper')
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

  context "InfoCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ScapContent::InfoCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end

    context "output" do
      with_params ["--id=1"] do
        it_should_print_n_records 1
        it_should_print_columns ["Id", "Title", "Created at", "Original filename", "SCAP content profiles", "Organizations"]
      end
    end
  end
end
