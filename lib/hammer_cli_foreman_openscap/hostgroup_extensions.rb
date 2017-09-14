require 'hammer_cli_foreman/hostgroup'

module HammerCLIForemanOpenscap
  ::HammerCLIForeman::Hostgroup::InfoCommand.instance_eval do
    output do
      field :openscap_proxy_id, _('OpenSCAP Proxy')
    end
  end
end
