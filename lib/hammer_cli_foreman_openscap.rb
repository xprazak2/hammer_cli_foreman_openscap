require 'hammer_cli_foreman'

module HammerCLIForemanOpenscap
  def self.exception_handler_port
    HammerCLIForeman::ExceptionHandler
  end

  HammerCLI::MainCommand.lazy_subcommand("arf-report", _("Manipulate compliance reports."),
                                         "HammerCLIForemanOpenscap::ArfReport",
                                         "hammer_cli_foreman_openscap/arf_report")
end
