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

    class CreateCommand < HammerCLIForemanOpenscap::CreateWithScapFileCommand
      success_message _("Scap content successfully created")
      failure_message _("Failed to create Scap content")

      scap_file_option _("Scap content file")

      build_options
    end

    class DeleteCommand < HammerCLIForemanOpenscap::DeleteCommand
      success_message _("Scap content deleted")
      failure_message _("Could not delete Scap content")

      build_options
    end

    class InfoCommand < HammerCLIForemanOpenscap::InfoCommand
      output ListCommand.output_definition do
        field :created_at, _("Created at")
        field :original_filename, _("Original filename")

        collection :scap_content_profiles, _("Scap content profiles") do
          field :id, _("Id")
          field :profile_id, _("Profile id")
          field :title, _("Title")
        end
        HammerCLIForeman::References.taxonomies(self)
      end
      build_options
    end

    class UpdateCommand < HammerCLIForemanOpenscap::UpdateCommand
      success_message _("Scap content updated")
      failure_message _("Could not update Scap content")

      option "--scap-file", "SCAP_FILE", _("Scap content file"),
                   :attribute_name => :option_scap_file,
                   :format => HammerCLI::Options::Normalizers::File.new
      build_options
    end

    class DownloadCommand < HammerCLIForemanOpenscap::DownloadXmlCommand
      success_message _("Scap content file downloaded, saved to: ")
      failure_message _("Could not download the Scap content file")

      build_options
    end

    autoload_subcommands
  end
end
