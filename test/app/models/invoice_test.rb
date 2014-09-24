require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class InvoiceTest < Test::Unit::TestCase
  context "Invoice Model" do
    should 'construct new instance' do
      @invoice = Invoice.new
      assert_not_nil @invoice
    end
  end
end
