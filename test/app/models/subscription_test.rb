require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class SubscriptionTest < Test::Unit::TestCase
  context "Subscription Model" do
    should 'construct new instance' do
      @subscription = Subscription.new
      assert_not_nil @subscription
    end
  end
end
