module HammerCLIForemanOpenscap
  class Searchables < HammerCLIForeman::Searchables
    SEARCHABLES = {
      :scap_content => [s("title", _("Scap content title"))],
      :arf_report => [],
      :policy => [s_name(_("Policy name"))],
      :tailoring_file => [s_name('Tailoring file name')]
    }

    DEFAULT_SEARCHABLES = [s_name(_("Name to search by"))]

    def for(resource)
      SEARCHABLES[resource.singular_name.to_sym] || DEFAULT_SEARCHABLES
    end
  end
end
