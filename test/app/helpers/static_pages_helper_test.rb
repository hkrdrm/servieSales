require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServieSales::App::StaticPagesHelperTest < Test::Unit::TestCase
  context "ServieSales::App::StaticPagesHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend ServieSales::App::StaticPagesHelper
    end

    def helpers
      @helpers
    end

    should "return nil" do
      assert_equal nil, helpers.foo
    end
  end
end
