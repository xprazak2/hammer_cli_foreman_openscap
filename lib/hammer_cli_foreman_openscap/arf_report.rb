module HammerCLIForemanOpenscap
  class ArfReport < HammerCLIForeman::Command

    resource :arf_reports

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :reported_at, _("Reported at")
        field :host, _("Host"), Fields::Reference, :hide_blank => true
        field :openscap_proxy, _("OpenSCAP proxy"), Fields::Reference, :hide_blank => true
        field :policy, _("Policy"), Fields::Reference, :hide_blank => true
        field :passed, _("Passed")
        field :failed, _("Failed")
        field :othered, _("Othered")
      end
      build_options
    end

    class InfoCommand < HammerCLIForemanOpenscap::InfoCommand
      output ListCommand.output_definition do
        HammerCLIForeman::References.taxonomies(self)
      end

      build_options
    end

    class DeleteCommand < HammerCLIForemanOpenscap::DeleteCommand
      success_message _("ARF report deleted")
      failure_message _("Could not delete the ARF report")

      build_options
    end

    class DownloadCommand < HammerCLIForemanOpenscap::DownloadCommand
      success_message _("ARF report downloaded, saved to: ")
      failure_message _("Could not download the ARF report")

      build_options
    end

    class DownloadHtmlCommand < HammerCLIForemanOpenscap::DownloadCommand
      action :download_html
      success_message _("ARF report in HTML downloaded, saved to: ")
      failure_message _("Could not download the ARF report in HTML")

      def self.command_name(name = "download-html")
        super(name)
      end

      build_options
    end

    autoload_subcommands
  end
end
