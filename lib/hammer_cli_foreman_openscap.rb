require 'hammer_cli_foreman'
require 'hammer_cli_foreman_openscap/id_resolver'
require 'hammer_cli_foreman_openscap/commands'
require 'hammer_cli_foreman_openscap/error'
require 'hammer_cli_foreman_openscap/exception_handler'

module HammerCLIForemanOpenscap
  def self.exception_handler_class
    HammerCLIForemanOpenscap::ExceptionHandler
  end

  HammerCLI::MainCommand.lazy_subcommand("arf-report", _("Manipulate compliance reports."),
                                         "HammerCLIForemanOpenscap::ArfReport",
                                         "hammer_cli_foreman_openscap/arf_report")

  HammerCLI::MainCommand.lazy_subcommand("policy", _("Manipulate policies."),
                                         "HammerCLIForemanOpenscap::Policy",
                                         "hammer_cli_foreman_openscap/policy")

  HammerCLI::MainCommand.lazy_subcommand("scap-content", _("Manipulate Scap contents."),
                                         "HammerCLIForemanOpenscap::ScapContent",
                                         "hammer_cli_foreman_openscap/scap_content")

end
