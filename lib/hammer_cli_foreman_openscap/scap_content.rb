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

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Scap content deleted")
      failure_message _("Could not delete Scap content")

      build_options
    end

    autoload_subcommands
  end
end
