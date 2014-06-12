require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ActiveSubscriptionTest < Test::Unit::TestCase
  context "ActiveSubscription Model" do
    should 'construct new instance' do
      @active_subscription = ActiveSubscription.new
      assert_not_nil @active_subscription
    end
  end
end
