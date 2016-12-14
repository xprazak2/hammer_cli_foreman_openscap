module HammerCLIForemanOpenscap
  class TailoringFile < HammerCLIForeman::Command

    resource :tailoring_files

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :name, _("Name")
      end
      build_options
    end

    class CreateCommand < HammerCLIForemanOpenscap::CreateWithScapFileCommand
      success_message _("Tailoring file successfully created")
      failure_message _("Failed to create Tailoring file")

      scap_file_option _("Tailoring file content")

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Tailoring file deleted")
      failure_message _("Could not delete Tailoring file")

      build_options
    end

    class InfoCommand < HammerCLIForemanOpenscap::InfoCommand
      output ListCommand.output_definition do
        field :created_at, _("Created at")
        field :original_filename, _("Original filename")

        collection :tailoring_file_profiles, _("Tailoring file profiles") do
          field :id, _("Id")
          field :profile_id, _("Profile id")
          field :title, _("Title")
        end
        HammerCLIForeman::References.taxonomies(self)
      end
      build_options
    end

    class UpdateCommand < HammerCLIForemanOpenscap::UpdateCommand
      success_message _("Tailoring file updated")
      failure_message _("Could not update Tailoring file")

      option "--scap-file", "SCAP_FILE", _("Tailoring file content"),
                   :attribute_name => :option_scap_file,
                   :format => HammerCLI::Options::Normalizers::File.new

      build_options
    end

    class DownloadCommand < HammerCLIForemanOpenscap::DownloadXmlCommand
      success_message _("Tailoring file downloaded, saved to: ")
      failure_message _("Could not download the Tailoring file")

      build_options
    end

    autoload_subcommands
  end
end
