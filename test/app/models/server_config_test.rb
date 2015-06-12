require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServerConfigTest < Test::Unit::TestCase
  context "ServerConfig Model" do
    should 'construct new instance' do
      @server_config = ServerConfig.new
      assert_not_nil @server_config
    end
  end
end
