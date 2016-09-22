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

  class DownloadCommand < HammerCLIForeman::Command
    include HammerCLIForemanOpenscap::ResolverCommons
    action :download

    def self.command_name(name = nil)
      super(name) || "download"
    end

    def request_options
      { :response => :raw }
    end

    def print_data(response)
      # get file name from header, remove leading and trailing quotes
      filename = response.headers[:content_disposition].match(/filename=(.*)/)[1].chop.reverse.chop.reverse
      path = option_path.dup || '.'
      path << '/' unless path.end_with? '/'
      raise HammerCLIForemanOpenscap::DownloadError.new "Cannot save file: #{path} does not exist" unless File.directory?(path)
      File.write(path + filename, response.body)
    end
  end
end
