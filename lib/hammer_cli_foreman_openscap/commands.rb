module HammerCLIForemanOpenscap
  module ResolverCommons
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def resolver
        api = HammerCLI::Connection.get("foreman").api
        HammerCLIForeman::IdResolver.new(api, HammerCLIForemanOpenscap::Searchables.new)
      end

      def searchables
        @searchables ||= HammerCLIForemanOpenscap::Searchables.new
        @searchables
      end
    end
  end

  class UpdateCommand < HammerCLIForeman::UpdateCommand
    include HammerCLIForemanOpenscap::ResolverCommons
  end

  class InfoCommand < HammerCLIForeman::InfoCommand
    include HammerCLIForemanOpenscap::ResolverCommons
  end

  class CreateCommand < HammerCLIForeman::CreateCommand
    include HammerCLIForemanOpenscap::ResolverCommons
  end
end
