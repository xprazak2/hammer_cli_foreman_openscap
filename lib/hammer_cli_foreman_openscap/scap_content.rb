module HammerCLIForemanOpenscap
  class ScapContent < HammerCLIForeman::Command

    resource :scap_contents

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :title, _("Title")
      end
      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _("Scap content successfully created")
      failure_message _("Failed to create Scap content")

      option "--scap-file", "SCAP_FILE", _("Scap content file"),
                   :attribute_name => :option_scap_file,
                   :format => HammerCLI::Options::Normalizers::File.new
      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Scap content deleted")
      failure_message _("Could not delete Scap content")

      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output ListCommand.output_definition do
        field :created_at, _("Created at")
        field :original_filename, _("Original filename")

        collection :scap_content_profiles, _("Scap content profiles") do
          field :id, _("Id")
          field :profile_id, _("Profile id")
          field :title, _("Title")
        end

        collection :organizations, _("Organizations") do
          field :id, _("Id")
          field :name, _("Name")
        end
      end
      build_options
    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      success_message _("Scap content updated")
      failure_message _("Could not update Scap content")

      option "--scap-file", "SCAP_FILE", _("Scap content file"),
                   :attribute_name => :option_scap_file,
                   :format => HammerCLI::Options::Normalizers::File.new
      build_options
    end

    autoload_subcommands
  end
end
