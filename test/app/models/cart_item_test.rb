require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class CartItemTest < Test::Unit::TestCase
  context "CartItem Model" do
    should 'construct new instance' do
      @cart_item = CartItem.new
      assert_not_nil @cart_item
    end
  end
end
