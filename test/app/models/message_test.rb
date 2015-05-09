require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class MessageTest < Test::Unit::TestCase
  context "Message Model" do
    should 'construct new instance' do
      @message = Message.new
      assert_not_nil @message
    end
  end
end
