# Helper methods defined here can be accessed in any controller or view in the application
require 'net/ping'
module ServieSales
  class App
    module ServersHelper
      def pingServer(server)
        p1 = Net::Ping::External.new(server)
        p p1.ping? 	
      end
    end

    helpers ServersHelper
  end
end
