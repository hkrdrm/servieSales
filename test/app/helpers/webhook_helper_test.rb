require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ServieSales::App::WebhookHelperTest < Test::Unit::TestCase
  context "ServieSales::App::WebhookHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend ServieSales::App::WebhookHelper
    end

    def helpers
      @helpers
    end

    should "return nil" do
      assert_equal nil, helpers.foo
    end
  end
end
