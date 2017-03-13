 require File.join(Gem.loaded_specs['hammer_cli_foreman'].full_gem_path, 'test/unit/apipie_resource_mock')

 module ComplianceResourceMock
  def self.arf
    {
      :id => 1,
      :host => "somewhere.example.com",
      :reported_at => "1916-06-08",
      :passed => 24,
      :failed => 25,
      :othered => 26,
      :opeancap_proxy_name => "scap_proxy.example.com"
    }
  end

  def self.policy
    {
      :id => 1,
      :name => "Very strict policy",
      :period => "monthly",
      :weekday => "",
      :cron_line => "0 * * * *",
      :scap_content_id => 5,
      :scap_content_profile_id => 5
    }
  end

  def self.scap_content
    {
      :id => 1,
      :title => "Red Hat fedora default content"
    }
  end

  def self.tailoring_file
    {
      :id => 1,
      :name => "Red Hat fedora tailored"
    }
  end


  def self.arf_reports_list
    ResourceMocks.mock_action_call(:arf_reports, :index, [arf])
  end

  def self.policies_list
    ResourceMocks.mock_action_call(:policies, :index, [policy])
  end

  def self.scap_contents_list
    ResourceMocks.mock_action_call(:scap_contents, :index, [scap_content])
  end

  def self.tailoring_files_list
    ResourceMocks.mock_action_call(:tailoring_files, :index, [tailoring_file])
  end
end
