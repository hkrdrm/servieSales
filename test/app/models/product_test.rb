require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ProductTest < Test::Unit::TestCase
  context "Product Model" do
    should 'construct new instance' do
      @product = Product.new
      assert_not_nil @product
    end
  end
end
