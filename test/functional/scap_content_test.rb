require File.join(File.dirname(__FILE__), './test_helper')

describe 'scap content' do
  describe 'download' do
    before do
      @cmd = %w(scap-content download)
    end

    it "should require --path for download" do
      params = ["--id=42"]

      expected_result = CommandExpectation.new
      expected_result.expected_err =
        ['Could not download the SCAP content file:',
         '  Error: Option --path is required.',
         '  ',
         "  See: 'hammer scap-content download --help'.",
         ''].join("\n")

      expected_result.expected_exit_code = HammerCLI::EX_USAGE

      api_expects_no_call
      result = run_cmd(@cmd + params)
      assert_cmd(expected_result, result)
    end
  end
end
