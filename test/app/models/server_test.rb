require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServerTest < Test::Unit::TestCase
  context "Server Model" do
    should 'construct new instance' do
      @server = Server.new
      assert_not_nil @server
    end
  end
end
