# Helper methods defined here can be accessed in any controller or view in the application
require 'ffi-rzmq'
require 'json'

module ServieSales
  class App
    module ServerNodesHelper

      #get status of all nodes and put in hashMap
      def get_all_nodes_status
        @serverNodes = ServerNode.all

        nodeStatus = Hash.new
        @serverNodes.each do |node|
          nodeStatus[node.id] = get_node_status(node.ip)
        end
        nodeStatus
      end

      #get status of single node
      def get_node_status(ip)
        context = ZMQ::Context.new
        requester = context.socket(ZMQ::REQ)
        requester.connect("tcp://localhost:5555")

        server_request = {fn: "getStatus"}

        requester.send_string server_request.to_json

        reply = ''
        requester.recv_string(reply)

        reply
      end

    end

    helpers ServerNodesHelper
  end
end
