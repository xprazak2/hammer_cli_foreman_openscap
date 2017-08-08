require File.join(File.dirname(__FILE__), 'test_helper')
require 'hammer_cli_foreman_openscap/arf_report'

describe HammerCLIForemanOpenscap::ArfReport do
  include CommandTestHelper

  context  "ListCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ArfReport::ListCommand.new "", ctx }

    before :each do
      ComplianceResourceMock.arf_reports_list
    end

    context "parameters" do
      it_should_accept "no arguments"
      it_should_accept_search_params
    end

    context "output" do
      let(:expected_record_count) { cmd.resource.call(:index).length }
      it_should_print_n_records
      it_should_print_columns ["Id", "Reported at", "Host name", "Openscap proxy name", "Policy name", "Passed", "Failed", "Othered"]
    end
  end

  context "InfoCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ArfReport::InfoCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end

    context "output" do
      with_params ["--id=1"] do
        it_should_print_n_records 1
        it_should_print_columns ["Id", "Reported at", "Host name", "OpenSCAP proxy name", "Policy name", "Passed", "Failed", "Othered", "Host Id", "OpenSCAP proxy Id", "Policy Id"]
      end
    end
  end

  context "DeleteCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ArfReport::DeleteCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
      it_should_fail_with "name", ["--name=something"]
    end
  end

  context "DownloadCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ArfReport::DownloadCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id and path", ["--id=1", "--path='/tmp'"]
    end
  end

  context "DownloadHtmlCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::ArfReport::DownloadHtmlCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id and path", ["--id=1", "--path='/tmp'"]
    end
  end
end
