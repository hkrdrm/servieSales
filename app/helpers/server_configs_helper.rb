# Helper methods defined here can be accessed in any controller or view in the application
require 'ffi-rzmq'
require 'json'

module ServieSales
  class App
    module ServerConfigHelper

      def connect_to_server(ip)
        context = ZMQ::Context.new
        requester = context.socket(ZMQ::REQ)
        requester.connect("tcp://#{ip}:5555")
        requester
      end

      def update_config(server_id, murmur_config)
        requester = connect_to_server(get_best_node)
        requester.send_string murmur_config

        reply = ''
        requester.recv_string(reply)
        repy_json = JSON.parse(reply)
        repy_json
      end
    end
  end
end
