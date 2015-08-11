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
        #context = ZMQ::Context.new
        #requester = context.socket(ZMQ::REQ)
        #requester.connect("tcp://#{ip}:5555")

        requester = connect_to_node(ip)

        server_request = {fn: "getStatus"}

        requester.send_string server_request.to_json

        reply = ''
        requester.recv_string(reply)
        repy_json = JSON.parse(reply)
        repy_json
      end

      def connect_to_node(ip)
        context = ZMQ::Context.new
        requester = context.socket(ZMQ::REQ)
        requester.connect("tcp://#{ip}:5555")
        requester
      end

      def get_best_node
        server_nodes = ServerNode.all
        ip = nil
        server_nodes.each do |node|
          if(node.max_accounts > node.active_accounts)
            ip = node.ip
            break
          else
            ip = false
          end
        end
        ip
      end

      def create_server(id)
        ip = get_best_node
        requester = connect_to_node(ip)
        server_request = {fn: "createServer", param: id}
        requester.send_string server_request.to_json

        reply = ''
        requester.recv_string(reply)
        repy_json = JSON.parse(reply)
        ip
      end

    end

    helpers ServerNodesHelper
  end
end
