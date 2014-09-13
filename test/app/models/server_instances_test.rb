require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServerInstancesTest < Test::Unit::TestCase
  context "ServerInstances Model" do
    should 'construct new instance' do
      @server_instances = ServerInstances.new
      assert_not_nil @server_instances
    end
  end
end
