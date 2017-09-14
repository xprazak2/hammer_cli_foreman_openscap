require 'hammer_cli_foreman/host'

module HammerCLIForemanOpenscap
  ::HammerCLIForeman::Host::InfoCommand.instance_eval do
    output do
      field :openscap_proxy_id, _('OpenSCAP Proxy')
    end
  end
end
