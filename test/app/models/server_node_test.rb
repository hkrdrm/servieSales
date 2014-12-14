require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServerNodeTest < Test::Unit::TestCase
  context "ServerNode Model" do
    should 'construct new instance' do
      @server_node = ServerNode.new
      assert_not_nil @server_node
    end
  end
end
