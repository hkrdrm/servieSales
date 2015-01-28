require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class CartTest < Test::Unit::TestCase
  context "Cart Model" do
    should 'construct new instance' do
      @cart = Cart.new
      assert_not_nil @cart
    end
  end
end
