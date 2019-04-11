require 'hammer_cli_foreman/host'
require 'hammer_cli_foreman_openscap/host_extensions'

module HammerCLIForemanOpenscap
  class Host < HammerCLIForeman::Command
    resource :hosts

    class PoliciesEnc < HammerCLIForeman::ListCommand
      command_name "policies-enc"
      action :policies_enc

      output do
        field :id, _('Id')
        field :profile_id, _('Profile Id')
        field :content_path, _('Content path')
        field :download_path, _('Content download path')
        field :tailoring_path, _('Tailoring path')
        field :tailoring_download_path, _('Tailoring download path')
        field :monthday, _('Day of month')
        field :hour, _('Hour')
        field :minute, ('Minute')
        field :month, _('Month')
        field :week, _('Week')
      end

      build_options
    end
    autoload_subcommands
  end
end
