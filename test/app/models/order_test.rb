require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class OrderTest < Test::Unit::TestCase
  context "Order Model" do
    should 'construct new instance' do
      @order = Order.new
      assert_not_nil @order
    end
  end
end
