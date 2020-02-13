require File.join(File.dirname(__FILE__), './test_helper')

describe 'tailoring file' do
  describe 'create' do
    before do
      @cmd = %w(tailoring-file create)
    end

    it 'should print error on missing --scap-file' do
      params = ['--name=test']

      expected_result = CommandExpectation.new
      expected_result.expected_err =
        "Failed to create Tailoring file:\n  Missing arguments for '--scap-file'.\n"
      expected_result.expected_exit_code = HammerCLI::EX_USAGE

      api_expects_no_call
      result = run_cmd(@cmd + params)
      assert_cmd(expected_result, result)
    end

    it "should detect original name from uploaded scap file" do
      file_path = File.join(fixtures_path, 'tailoring.xml')
      params = ["--name=test", "--scap-file=#{file_path}"]

      api_expects(:tailoring_files, :create, 'Create Tailoring file').with_params({
        'tailoring_file' => { 'name' => 'test', 'original_filename' => 'tailoring.xml', 'scap_file' => File.read(file_path) }
      })

      result = run_cmd(@cmd + params)
      assert_cmd(success_result("Tailoring file successfully created\n"), result)
    end
  end

  describe 'download' do
    before do
      @cmd = %w(tailoring-file download)
    end

    it "should require --path for download" do
      params = ["--id=42"]

      expected_result = CommandExpectation.new
      expected_result.expected_err =
        ['Could not download the Tailoring file:',
         '  Error: Option --path is required.',
         '  ',
         "  See: 'hammer tailoring-file download --help'.",
         ''].join("\n")

      expected_result.expected_exit_code = HammerCLI::EX_USAGE

      api_expects_no_call
      result = run_cmd(@cmd + params)
      assert_cmd(expected_result, result)
    end
  end
end
