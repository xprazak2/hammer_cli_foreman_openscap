module HammerCLIForemanOpenscap
  class ScapContentProfile < HammerCLIForeman::Command
    resource :scap_content_profiles

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :title, _("Title")
        field :profile_id, _("Profile Id")
        from :scap_content do
          field :id, _("Scap Content Id")
          field :title, _("Scap Content Title")
        end
        from :tailoring_file do
          field :id, _("Tailoring File Id")
          field :name, _("Tailoring File Name")
        end
      end

      def adapter
        @context[:adapter] || :base
      end

      build_options
    end

    autoload_subcommands
  end
end
