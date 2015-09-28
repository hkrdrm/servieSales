require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class ServerNodesTest < Test::Unit::TestCase
  context "ServerNodes Model" do
    should 'construct new instance' do
      @server_nodes = ServerNodes.new
      assert_not_nil @server_nodes
    end
  end
end
