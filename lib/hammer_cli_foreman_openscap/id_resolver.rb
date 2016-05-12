module HammerCLIForemanOpenscap
  class Searchables < HammerCLIForeman::Searchables
    SEARCHABLES = {
      :scap_content => []
    }

    DEFAULT_SEARCHABLES = [s_name(_("Name to search by"))]

    def for(resource)
      SEARCHABLES[resource.singular_name.to_sym] || DEFAULT_SEARCHABLES
    end
  end
end
