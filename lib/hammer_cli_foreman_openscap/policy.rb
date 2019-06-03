module HammerCLIForemanOpenscap
  class Policy < HammerCLIForeman::Command

    resource :policies

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :name, _("Name")
        field :created_at, _("Created at")
      end
      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output ListCommand.output_definition do
        field :period, _("Period")
        field :weekday, _("Weekday")
        field :day_of_month, _("Day of month")
        field :cron_line, _("Cron line")
        field :scap_content_id, _("SCAP content Id")
        field :scap_content_profile_id, _("SCAP Content profile Id")
        field :tailoring_file_id, _("Tailoring file Id")
        field :tailoring_file_profile_id, _("Tailoring file profile Id")
        field :deploy_by, _("Deployment option")
        HammerCLIForeman::References.taxonomies(self)
        HammerCLIForeman::References.hostgroups(self)
      end
      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Policy has been deleted")
      failure_message _("Could not delete the policy")

      build_options
    end

    class CreateCommand < HammerCLIForemanOpenscap::CreateCommand

      success_message _("Policy created")
      failure_message _("Could not create the policy")

      build_options

    end

    class UpdateCommand < HammerCLIForemanOpenscap::UpdateCommand
      success_message _("Policy updated")
      failure_message _("Could not update the policy")

      build_options
    end

    class HostsCommand < HammerCLIForeman::AssociatedListSearchCommand
      command_name 'hosts'
      search_resource :hosts

      def self.search_options_mapping
        {
          'id' => 'compliance_policy_id',
          'name' => 'compliance_policy'
        }
      end

      output HammerCLIForeman::Host::ListCommand.output_definition

      build_options
    end

    autoload_subcommands
  end
end
