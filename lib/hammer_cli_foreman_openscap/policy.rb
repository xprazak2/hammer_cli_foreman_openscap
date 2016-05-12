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
        field :cron_line, _("Cron line")
        field :scap_content_id, _("Scap content Id")
        field :scap_content_profile_id, _("Scap Content profile Id")

        collection :organizations, _("Organizations") do
          field :id, _("Id")
          field :name, _("Name")
        end
      end
      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Policy has been deleted")
      failure_message _("Could not delete the policy")

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand

      success_message _("Policy created")
      failure_message _("Could not create the policy")

      build_options

    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      success_message _("Policy updated")
      failure_message _("Could not update the policy")

      build_options
    end

    autoload_subcommands
  end
end
