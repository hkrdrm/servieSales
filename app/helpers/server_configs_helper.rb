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

      def update_config(server_id)
        requester = connect_to_server("localhost")
        requester.send_string write_config_file(server_id)

        reply = ''
        requester.recv_string(reply)
        repy = reply
        repy
      end

      def write_config_file(server_id)
        server_conf = ServerConfig.find_by_server_id(server_id)
        server_conf = server_conf.as_json
        conf_file = ""
        ServerConfig.column_names.each do |col|
          conf_file += col.to_s + " = " + server_conf[col].to_s + "\n"
        end
        file = File.open("/home/hkrdrm/sample2.txt", "w")
        file.puts conf_file
        file.close
        conf_file
      end

    end
    helpers ServerConfigHelper
  end
end
