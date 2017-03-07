module HammerCLIForemanOpenscap
  module ResolverCommons
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def api_connection
        if HammerCLI.context[:api_connection]
          HammerCLI.context[:api_connection].get("foreman")
        else
          HammerCLI::Connection.get("foreman").api
        end
      end

      def resolver
        HammerCLIForeman::IdResolver.new(
          api_connection,
          HammerCLIForemanOpenscap::Searchables.new
        )
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

  class DownloadCommand < HammerCLIForeman::SingleResourceCommand
    include HammerCLIForemanOpenscap::ResolverCommons
    action :download

    def self.command_name(name = nil)
      super(name) || "download"
    end

    def request_options
      { :response => :raw }
    end

    def validate_options
      super
      validator.option(:option_path).required
    end

    def success_message
      super + @filepath
    end

    option "--path", "PATH", _("Path to a directory where downloaded file will be saved"),
        :attribute_name => :option_path

    def print_data(response)
      if response.body.empty?
        print_message "Response success but empty body was returned - file was not saved"
        return
      end
      # get file name from header, remove leading and trailing quotes
      filename = response.headers[:content_disposition].match(/filename=(.*)/)[1].chop.reverse.chop.reverse
      path = option_path.dup || '.'
      path << '/' unless path.end_with? '/'
      raise HammerCLIForemanOpenscap::DownloadError.new "Cannot save file: #{path} does not exist" unless File.directory?(path)
      @filepath = path + filename
      File.write(@filepath, response.body)
      print_success_message(response)
    end
  end
end
