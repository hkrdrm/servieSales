require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class NodeServerTest < Test::Unit::TestCase
  context "NodeServer Model" do
    should 'construct new instance' do
      @node_server = NodeServer.new
      assert_not_nil @node_server
    end
  end
end
