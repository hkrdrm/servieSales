require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServieSales::App::CartHelperTest < Test::Unit::TestCase
  context "ServieSales::App::CartHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend ServieSales::App::CartHelper
    end

    def helpers
      @helpers
    end

    should "return nil" do
      assert_equal nil, helpers.foo
    end
  end
end
