require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ConfigOptionsTest < Test::Unit::TestCase
  context "ConfigOptions Model" do
    should 'construct new instance' do
      @config_options = ConfigOptions.new
      assert_not_nil @config_options
    end
  end
end
