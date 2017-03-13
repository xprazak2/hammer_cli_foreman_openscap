require File.join(File.dirname(__FILE__), 'test_helper')
require 'hammer_cli_foreman_openscap/tailoring_file'

describe HammerCLIForemanOpenscap::TailoringFile do
  include CommandTestHelper

  context "ListCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::TailoringFile::ListCommand.new "", ctx }

    before :each do
      ComplianceResourceMock.tailoring_files_list
    end

    context "parameters" do
      it_should_accept "no arguments"
      it_should_accept_search_params
    end

    context "output" do
      let(:expected_record_count) { cmd.resource.call(:index).length }
      it_should_print_n_records
      it_should_print_columns ["Id", "Name"]
    end
  end

  context "DeleteCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::TailoringFile::DeleteCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end
  end

  context "UpdateCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::TailoringFile::UpdateCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end
  end

  context "InfoCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::TailoringFile::InfoCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end

    context "output" do
      with_params ["--id=1"] do
        it_should_print_n_records 1
        it_should_print_columns ["Id", "Name", "Created at", "Original filename", "Tailoring file profiles", "Organizations"]
      end
    end
  end
end
