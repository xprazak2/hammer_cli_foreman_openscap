require 'hammer_cli_foreman'
require 'hammer_cli_foreman_openscap/options/normalizers'
require 'hammer_cli_foreman_openscap/id_resolver'
require 'hammer_cli_foreman_openscap/commands'
require 'hammer_cli_foreman_openscap/error'
require 'hammer_cli_foreman_openscap/exception_handler'
require 'hammer_cli_foreman_openscap/hostgroup'
require 'hammer_cli_foreman_openscap/host'
require 'pry-byebug'

module HammerCLIForemanOpenscap
  require 'hammer_cli_foreman_openscap/version'

  def self.exception_handler_class
    HammerCLIForemanOpenscap::ExceptionHandler
  end

  HammerCLI::MainCommand.lazy_subcommand("arf-report", _("Manipulate compliance reports"),
                                         "HammerCLIForemanOpenscap::ArfReport",
                                         "hammer_cli_foreman_openscap/arf_report")

  HammerCLI::MainCommand.lazy_subcommand("policy", _("Manipulate policies"),
                                         "HammerCLIForemanOpenscap::Policy",
                                         "hammer_cli_foreman_openscap/policy")

  HammerCLI::MainCommand.lazy_subcommand("scap-content", _("Manipulate SCAP contents"),
                                         "HammerCLIForemanOpenscap::ScapContent",
                                         "hammer_cli_foreman_openscap/scap_content")

  HammerCLI::MainCommand.lazy_subcommand("tailoring-file", _("Manipulate Tailoring files"),
                                         "HammerCLIForemanOpenscap::TailoringFile",
                                         "hammer_cli_foreman_openscap/tailoring_file")
end
