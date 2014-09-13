require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServerInstanceslsTest < Test::Unit::TestCase
  context "ServerInstancesls Model" do
    should 'construct new instance' do
      @server_instancesls = ServerInstancesls.new
      assert_not_nil @server_instancesls
    end
  end
end
