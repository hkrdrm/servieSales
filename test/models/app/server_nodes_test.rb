require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class App::ServerNodesTest < Test::Unit::TestCase
  context "App::ServerNodes Model" do
    should 'construct new instance' do
      @app/server_nodes = App::ServerNodes.new
      assert_not_nil @app/server_nodes
    end
  end
end
